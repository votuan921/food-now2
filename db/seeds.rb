require "ffaker"

start_time = "6-am"
end_time = "50-pm"

20.times do |u|
  user = User.new
  user.name = "User"+u.to_s
  user.email = "user"+u.to_s+"@user.com"
  user.address = "Thanh Xuan, Ha Noi"
  user.password = '123456'
  user.role = "normal"
  user.password_confirmation = "123456"
  user.save!
end

20.times do |m|
  manager = User.new
  manager.name = "Manager"+m.to_s
  manager.email = "manager"+m.to_s+"@manager.com"
  manager.address = "Thanh Xuan, Ha Noi"
  manager.password = '123456'
  manager.role = "manager"
  manager.password_confirmation = "123456"
  manager.save!
end


admin = User.new
admin.name = "Admin"
admin.email = "admin@admin.com"
admin.address = "Thanh Xuan, Ha Noi"
admin.password = '123456'
admin.role = "admin"
admin.password_confirmation = "123456"
admin.save!

10.times do |n|
  name = FFaker::AddressCA::province

  Province.create!(
    name: name,
    created_at: Time.zone.now)
end

5.times do |n|
  name = FFaker::Address::city

  District.create!(
    name: name,
    province_id: Province.ids.sample,
    created_at: Time.zone.now)
end


20.times do |n|
  name = FFaker::Name.name
  address = FFaker::Address.city
  phone = FFaker::PhoneNumber.phone_number
  user_id = User.where('role = 1')[n].id
  district_id = District.find(1 + rand(5)).id
  start_time = "6-am"
  end_time = "5-pm"

  Store.create!(
    name: name,
    address: address,
    phone: phone,
    user_id: user_id,
    district_id: district_id,
    start_time: start_time,
    end_time: end_time,
    created_at: Time.zone.now)
end
