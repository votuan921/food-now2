require "ffaker"

namespace :seed_data do
  desc "Seed data"

  task users: :environment do
    User.create!(
      email: Settings.account.admin.email,
      name: Settings.account.admin.name,
      password: Settings.account.admin.password,
      password_confirmation: Settings.account.admin.password,
      address: Settings.account.admin.role,
      phone: Settings.account.admin.phone,
      role: Settings.account.admin.role,
      created_at: Time.zone.now)
    
    User.create!(
      email: Settings.account.manager.email,
      name: Settings.account.manager.name,
      password: Settings.account.manager.password,
      password_confirmation: Settings.account.manager.password,
      address: Settings.account.manager.role,
      phone: Settings.account.manager.phone,
      role: Settings.account.manager.role,
      created_at: Time.zone.now)
    
    20.times do |n|
      email = FFaker::Internet::free_email
      name = FFaker::Name.name
      address = FFaker::Address.city
      phone = FFaker::PhoneNumber.phone_number
    
      User.create!(
        email:  email,
        name: name,
        password: Settings.account.user.password,
        password_confirmation: Settings.account.user.password,
        address: address,
        phone: phone,
        role: Settings.account.user.role,
        created_at: Time.zone.now)
    end
  end

  task stores: :environment do
    50.times do |n|
      address = FFaker::Address.city
      phone = FFaker::PhoneNumber.phone_number
      user_id = User.ids.sample
      start_time = "6-am"
      end_time = "20-pm"
      
      Store.create!(
        address: address,
        phone: phone,
        user_id: user_id,
        start_time: start_time,
        end_time: end_time,
        created_at: Time.zone.now)
    end    
  end

  task combos: :environment do   
    50.times do |n|
      name = FFaker::Name.name
      status = 1
      price = rand(100000..900000)
      store_id = Store.ids.sample
      
      Combo.create!(
        name: name,
        status: status,
        price: price,
        store_id: store_id)
    end    
  end

  task products: :environment do   
    50.times do |n|
      name = FFaker::Product.product_name
      status = 1
      price = rand(100000..900000)
      store_id = Store.ids.sample
      
      Product.create!(
        name: name,
        status: status,
        price: price,
        store_id: store_id)
    end
  end

  task combo_products: :environment do   
    50.times do |n|
      combo_id = Combo.ids.sample
      product_id = Product.ids.sample
      
      ComboProduct.create!(
        combo_id: combo_id,
        product_id: product_id)
    end
  end

  task comments: :environment do   
    50.times do |n|
      content = FFaker::Lorem.paragraph
      user_id = User.ids.sample
      parent_comment_id = ([1, 2].sample.eql? 1) ? Comment.ids.sample : ""
      commentable_type = ["Combo", "Product"].sample
      commentable_id = (commentable_type.eql? "Combo") ? Combo.ids.sample : Product.ids.sample
    
      Comment.create!(
        content: content,
        user_id: user_id,
        parent_comment_id: parent_comment_id,
        commentable_type: commentable_type,
        commentable_id: commentable_id,
        created_at: Time.zone.now)
    end    
  end

  task bills: :environment do   
    50.times do |n|
      status = 0
      user_id = User.ids.sample
      store_id = Store.ids.sample
      address = FFaker::Address.street_address
    
      Bill.create!(
        status: status,
        user_id: user_id,
        store_id: store_id,
        address: address,
        created_at: Time.zone.now)
    end    
  end

  task bill_details: :environment do   
    50.times do |n|
      bill_id = Bill.ids.sample
      bill_detailable_type = ["Combo", "Product"].sample
      bill_detailable_id = (bill_detailable_type.eql? "Combo") ? Combo.ids.sample : Product.ids.sample
      count = rand(1..2)
      price = rand(10000..90000)
    
      BillDetail.create!(
        bill_id: bill_id,
        bill_detailable_type: bill_detailable_type,
        bill_detailable_id: bill_detailable_id,
        count: count,
        price: price)
    end    
  end

  task images: :environment do   
    50.times do |n|
      url = "defaultl.png"
      alt = "default image"
      image_type = "thumbnail"
      imageable_type = ["Combo", "Product"].sample
      imageable_id = (imageable_type.eql? "Combo") ? Combo.ids.sample : Product.ids.sample
    
      Image.create!(
        url: url,
        alt: alt,
        image_type: image_type,
        imageable_type: imageable_type,
        imageable_id: imageable_id)
    end        
  end
end
