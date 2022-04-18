# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(:id=>1, :email => 'admin@a.com', :name => '잠자는사자', :password => 'a12345', :password_confirmation => 'a12345', admin_picture_attributes: { picture: File.open(Rails.root.join("app", "assets", "images", "dog.png")) })
Admin.create!(:id=>2, :email => 'admin2@a.com',:name=>'매점 관리자',:password => 'a12345', :password_confirmation => 'a12345')
Admin.create!(:id=>3, :email => 'admin3@a.com',:name=>'매점 관리자',:password => 'a12345', :password_confirmation => 'a12345')

Role.create!(:id => 1, :title => 'super administrator')
Role.create!(:id=>2,:title=>'administrator')
Role.create!(:id=>3,:title=>'manager')
#Role.create!(:id=>4,:title=>'sub manager')
#Role.create!(:id=>5,:title=>'reader')

RoleAdmin.create!(:role_id => 1, :admin_id => 1)
RoleAdmin.create!(:role_id => 3, :admin_id => 2)
RoleAdmin.create!(:role_id => 3, :admin_id => 3)


Branch.create!(:id=>1, :title=>'본점')
Branch.create!(:id=>2, :title=>'달서점')
Branch.create!(:id=>3, :title=>'수성점')

User.create!(:id=>1, :name=>'이상미')
User.create!(:id=>2, :name=>'최혜경')
User.create!(:id=>3, :name=>'김현진')
User.create!(:id=>4, :name=>'권형국')
User.create!(:id=>5, :name=>'조선미')
User.create!(:id=>6, :name=>'이성남')
User.create!(:id=>7, :name=>'최희정')
User.create!(:id=>8, :name=>'신연우')
User.create!(:id=>9, :name=>'(주)호성상사')
User.create!(:id=>10, :name=>'김수자')

Order.create!(:id=>1, :user_id=>1, :branch_id=>1, :number=>'2201226331', :title=>'대구역서희스타힐스103/903', :transaction_date=>'2017-11-14')
Order.create!(:id=>2, :user_id=>2, :branch_id=>2, :number=>'2201242613', :title=>'상동동일하이빌106/301', :transaction_date=>'2017-12-06')
Order.create!(:id=>3, :user_id=>3, :branch_id=>1, :number=>'2201267463', :title=>'상인화성파크드림2109/301', :transaction_date=>'2017-11-24')
Order.create!(:id=>4, :user_id=>4, :branch_id=>1, :number=>'2201267450', :title=>'대우월드103/3403', :transaction_date=>'2018-01-15')
Order.create!(:id=>5, :user_id=>5, :branch_id=>1, :number=>'2201253912', :title=>'두산제니스109/4406', :transaction_date=>'2017-12-07')
Order.create!(:id=>6, :user_id=>6, :branch_id=>2, :number=>'2204628502', :title=>'월성이편한103/2202', :transaction_date=>'2018-01-17')
Order.create!(:id=>7, :user_id=>7, :branch_id=>1, :number=>'2201275583', :title=>'율하우방유쉘101/102', :transaction_date=>'2016-06-07')
Order.create!(:id=>8, :user_id=>8, :branch_id=>2, :number=>'2201275626', :title=>'도원롯데캐슬103/1705', :transaction_date=>'2016-10-24')
Order.create!(:id=>9, :user_id=>9, :branch_id=>3, :number=>'2201283143', :title=>'두산제니스105/4402', :transaction_date=>'2018-01-12')
Order.create!(:id=>10, :user_id=>10, :branch_id=>2, :number=>'2201298207', :title=>'수성4가이편한103/1802', :transaction_date=>'2018-02-01')

Receipt.create!(:id=>1,:title=>'현금영수증')
Receipt.create!(:id=>2,:title=>'세금계산서')

AccountCategory.create!(id: 1, title: '청소비', enable: true)
AccountCategory.create!(id: 2, title: '수정', enable: true)
AccountCategory.create!(id: 3, title: '환불', enable: true)
AccountCategory.create!(id: 4, title: '계약금', enable: true)

Account.create!(:id=>1, :account_category_id=>1, :user_id=>1, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=> 375000,:discount_price=> 307000,:payment=>317000)
Account.create!(:id=>2, :account_category_id=>1, :user_id=>2, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=>375000 ,:discount_price=> 375000,:payment=>387000)
Account.create!(:id=>3, :account_category_id=>1, :user_id=>3, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=> 304000,:discount_price=> 304000,:payment=>317000)
Account.create!(:id=>4, :account_category_id=>1, :user_id=>4, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=> 309000,:discount_price=> 309000,:payment=>319000)
Account.create!(:id=>5, :account_category_id=>1, :user_id=>5, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=> 319000,:discount_price=> 319000,:payment=>329000)
Account.create!(:id=>6, :account_category_id=>1, :user_id=>6, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=>307000 ,:discount_price=> 307000,:payment=>317000)
Account.create!(:id=>7, :account_category_id=>1, :user_id=>7, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=> 289000,:discount_price=> 289000,:payment=>298000)
Account.create!(:id=>8, :account_category_id=>1, :user_id=>8, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=>343000 ,:discount_price=> 343000,:payment=>354000)
Account.create!(:id=>9, :account_category_id=>1, :user_id=>9, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=>343000 ,:discount_price=> 342000,:payment=>394000)
Account.create!(:id=>10, :account_category_id=>1, :user_id=>10, :receipt_id=>1, :title=>'3월 청소비', :transaction_date=>'2017-11-14', :origin_price=>331000 ,:discount_price=>331000,:payment=>342000)

AccountOrder.create!(:account_id=>1,:order_id=>1)
AccountOrder.create!(:account_id=>2,:order_id=>2)
AccountOrder.create!(:account_id=>3,:order_id=>3)
AccountOrder.create!(:account_id=>4,:order_id=>4)
AccountOrder.create!(:account_id=>5,:order_id=>5)
AccountOrder.create!(:account_id=>6,:order_id=>6)
AccountOrder.create!(:account_id=>7,:order_id=>7)
AccountOrder.create!(:account_id=>8,:order_id=>8)
AccountOrder.create!(:account_id=>9,:order_id=>9)
AccountOrder.create!(:account_id=>10,:order_id=>10)
