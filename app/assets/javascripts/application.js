/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, or any plugin's
 * vendor/assets/stylesheets directory can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any other CSS/SCSS
 * files in this directory. Styles in this file should be added after the last require_* statement.
 * It is generally better to create a new file per style scope.
 *
//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap
//= require jquery_ujs
//= require i18n.js
 */

I18n.translations || (I18n.translations = {});
I18n.translations["ko"] = I18n.extend((I18n.translations["ko"] || {}), {"enable":"사용","disable":"미사용"});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"enable":"사용","disable":"미사용"});
I18n.translations["zh-CN"] = I18n.extend((I18n.translations["zh-CN"] || {}), {"enable":"사용","disable":"미사용"});

function setDateInput(obj) {
    if (obj != undefined) {
        var datediff = -(parseInt(obj));
        var newDate = new Date();
        var now = new Date();
        newDate.setDate(now.getDate()+datediff);
        var newYear = newDate.getFullYear();
        var newMonth = newDate.getMonth()+1;
        if (newMonth.toString().length == 1) newMonth = "0" + newMonth;

        endMonth=now.getMonth() +1;
        if (endMonth.toString().length == 1) endMonth = "0" + endMonth;

        var newDay = newDate.getDate();
        if (newDay.toString().length == 1) { newDay = "0" + newDay};

        var txtSDate = newYear + "-" + newMonth +'-'+ newDay;
        endDay=now.getDate();

        if (endDay.toString().length == 1) {endDay = "0" + endDay; };
        var txtEDate = now.getFullYear() + '-' + endMonth + "-" + endDay;

        $('input[name="start_date"]').val(txtSDate).effect("highlight");
        $('input[name="end_date"]').val(txtEDate).effect("highlight");
    } else {alert("잠시 후 이용해 주시기 바랍니다."); return false;}
}

$(document).ready(function() {
    $(document).on('change', '.custom-control-input', function (e) {
        let c_checked = e.target.checked;

        if(window.location.port!=80) {
            var port=':' + window.location.port;
        } else {
            var port='';
        }

        if(c_checked) {
            $(this).parent().find('.custom-control-label').text(I18n.t('enable')).closest('tr').effect('highlight');
        } else {
            $(this).parent().find('.custom-control-label').text(I18n.t('disable')).closest('tr').effect('highlight');
        }

        var param={_method: 'put', authenticity_token:$('meta[name="csrf-token"]').attr('content')}
        var path=window.location.pathname.split('/')[2];
        var url=window.location.protocol+'//'+window.location.hostname+port+'/admin/'+path+'/'+$(this).val()+'.json';
        var aa={operators:'operator',users:'user'}

        param[aa[path]]={enable:c_checked};
        $.post(url,param,function(data){

        },'json');
    });

    // 기간 선택시 날짜 채워지기
    $('input[name="date_p"]').change(function(){
        if($("#future_search").length) {
            if($("#future_search").val()==1) {
                if($(this).val()=='all') {
                    $('input[name="start_date"]').val('').effect("highlight");
                    $('input[name="end_date"]').val('').effect("highlight");
                } else {
                    setDateInput($(this).val());
                }
                return true;
            }
        }

        if($(this).val()=='all') {
            $('input[name="start_date"]').val('').effect("highlight");
            $('input[name="end_date"]').val('').effect("highlight");
        } else {
            setDateInput($(this).val());
        }
    });

    $('.input-daterange input').each(function() {
        $(this).datepicker({language: "ko",todayHighlight: true, maxViewMode : 'decades'});
    });
});
