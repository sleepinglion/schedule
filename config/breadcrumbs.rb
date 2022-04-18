crumb :root do
  link t(:home), root_path
end

crumb :info_menu do
   link t(:menu_info), ''
end

crumb :notices do
   link t('activerecord.models.notice'), notices_path
   parent :info_menu
end

crumb :info do
   link t(:menu_info), info_path
   parent :info_menu
end

crumb :mypage do
   link t(:menu_mypage),users_path
end

crumb :product do |product|
   link product.title, product_path(product)
   parent :products
end


crumb :notice do |notice|
   link notice.title, notice_path(notice)
   parent :notices
end
