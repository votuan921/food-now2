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

Store.create!([
  {name: "Tamaya Japanese Restaurant", address: "Hanoi Tower, 49 Hai Ba Trung Street,  Hoan Kiem, Ha Noi", phone: "0912345678", user_id: 21, start_time: "09:00", end_time: "21:00", vip: 3},
  {name: "Sushi Garden", address: "46 Vu Trong Phung Street, Thanh Xuân, Hà Nội", phone: "0912345678", user_id: 22, start_time: "10:00", end_time: "22:00", vip: 2},
  {name: "Sushi Aozora", address: "153 Thuy Khue Street, Tay Ho, Ha Noi", phone: "0912345678", user_id: 23, start_time: "10:30", end_time: "21:00", vip: 1},
  {name: "Moo Beef Steak", address: "59A Tran Quoc Toan, Hoan Kiem, Ha Noi", phone: "0912345678", user_id: 24, start_time: "11:00", end_time: "22:00", vip: 3},
  {name: "Beef House", address: "N04, UDIC Tower, Hoang Đao Thuy, Thanh Xuan, Ha Noi", phone: "0912345678", user_id: 25, start_time: "09:00", end_time: "23:00", vip: 1},
  {name: "Queen's Crab", address: "17T2 Hoang Dao Thuy, Cau Giay, Ha Noi", phone: "0912345678", user_id: 26, start_time: "08:00", end_time: "22:30", vip: 2},
  {name: "Seafood BBQ", address: "4th Floor Center Point, 27 Le Van Luong, Thanh Xuan, Ha Noi", phone: "0912345678", user_id: 27, start_time: "10:00", end_time: "22:00", vip: 1},
  {name: "Pizza Hut", address: "222 Tran Duy Hung Street, Cau Giay, Ha Noi", phone: "0912345678", user_id: 28, start_time: "10:00", end_time: "21:30", vip: 1}
])

Product.create!([
  {name: "Salmon Sashimi", price: 13.0, status: "active", store_id: 1},
  {name: "Nigiri sushi", price: 15.0, status: "active", store_id: 1},
  {name: "Chirashi sushi", price: 18.0, status: "active", store_id: 1},
  {name: "Maki sushi", price: 11.0, status: "active", store_id: 1},
  {name: "Gunkan sushi", price: 21.0, status: "active", store_id: 1},
  {name: "Octopus Sashimi", price: 25.0, status: "active", store_id: 1},
  {name: "Abalone Sashimi", price: 32.0, status: "active", store_id: 1},
  {name: "Oshizushi", price: 23.0, status: "active", store_id: 1},
  {name: "Salmon Sashimi", price: 13.0, status: "active", store_id: 2},
  {name: "Nigiri sushi", price: 15.0, status: "active", store_id: 2},
  {name: "Chirashi sushi", price: 18.0, status: "active", store_id: 2},
  {name: "Maki sushi", price: 11.0, status: "active", store_id: 2},
  {name: "Gunkan sushi", price: 21.0, status: "active", store_id: 2},
  {name: "Octopus Sashimi", price: 25.0, status: "active", store_id: 2},
  {name: "Salmon Sashimi", price: 13.0, status: "active", store_id: 3},
  {name: "Nigiri sushi", price: 15.0, status: "active", store_id: 3},
  {name: "Chirashi sushi", price: 18.0, status: "active", store_id: 3},
  {name: "Maki sushi", price: 11.0, status: "active", store_id: 3},
  {name: "Gunkan sushi", price: 21.0, status: "active", store_id: 3},
  {name: "Octopus Sashimi", price: 25.0, status: "active", store_id: 3},
  {name: "Steak Pepper Sauce", price: 32.0, status: "active", store_id: 4},
  {name: "Steak Cheese Sauce", price: 36.0, status: "active", store_id: 4},
  {name: "Steak Red Wine Sauce", price: 42.0, status: "active", store_id: 4},
  {name: "Steak Porcini Mushroom", price: 42.0, status: "active", store_id: 4},
  {name: "Steak Pepper Sauce", price: 32.0, status: "active", store_id: 5},
  {name: "Steak Cheese Sauce", price: 36.0, status: "active", store_id: 5},
  {name: "Steak Red Wine Sauce", price: 42.0, status: "active", store_id: 5},
  {name: "Steak Porcini Mushroom", price: 42.0, status: "active", store_id: 5},
  {name: "Crab Roasted", price: 50.0, status: "active", store_id: 6},
  {name: "Emperor's Crab", price: 82.0, status: "active", store_id: 6},
  {name: "Crab Meat Singapore Sauce", price: 92.0, status: "active", store_id: 6},
  {name: "Oysters grilled", price: 22.0, status: "active", store_id: 6},
  {name: "Fried shrimp", price: 17.0, status: "active", store_id: 6},
  {name: "Crab Roasted", price: 50.0, status: "active", store_id: 7},
  {name: "Emperor's Crab", price: 82.0, status: "active", store_id: 7},
  {name: "Crab Meat Singapore Sauce", price: 92.0, status: "active", store_id: 7},
  {name: "Oysters grilled", price: 22.0, status: "active", store_id: 7},
  {name: "Fried shrimp", price: 17.0, status: "active", store_id: 7},
  {name: "Seafood Buffet Set 1", price: 200.0, status: "active", store_id: 7},
  {name: "Premium Mixed Pizza", price: 10.0, status: "active", store_id: 8},
  {name: "Grilled Sausage Pizza", price: 15.0, status: "active", store_id: 8},
  {name: "Mixed Pizza Size M", price: 12.0, status: "active", store_id: 8},
  {name: "Italian Pizza", price: 21.0, status: "active", store_id: 8},
  {name: "Tuna Pizza", price: 17.0, status: "active", store_id: 8}
])


Image.create!([
  {url: "res_1_t.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 1},
  {url: "p1.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 1},
  {url: "p2.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 2},
  {url: "p3.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 3},
  {url: "p4.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 4},
  {url: "p5.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 5},
  {url: "p6.jpeg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 6},
  {url: "p7.jpeg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 7},
  {url: "p8.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 8},
  {url: "r2_t.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 2},
  {url: "p1.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 9},
  {url: "p2.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 10},
  {url: "p3.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 11},
  {url: "p4.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 12},
  {url: "p5.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 13},
  {url: "p6.jpeg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 14},
  {url: "p1.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 15},
  {url: "p2.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 16},
  {url: "p3.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 17},
  {url: "p4.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 18},
  {url: "p5.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 19},
  {url: "p6.jpeg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 20},
  {url: "r3_t.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 3},
  {url: "r4_t.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 4},
  {url: "p9.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 21},
  {url: "p10.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 22},
  {url: "p11.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 23},
  {url: "p12.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 24},
  {url: "r5_t.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 5},
  {url: "p9.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 25},
  {url: "p10.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 26},
  {url: "p11.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 27},
  {url: "p12.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 28},
  {url: "r6.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 6},
  {url: "p13.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 29},
  {url: "p14.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 30},
  {url: "p15.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 31},
  {url: "p17.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 32},
  {url: "p16.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 33},
  {url: "r7.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 7},
  {url: "p18.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 39},
  {url: "p14.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 34},
  {url: "p14.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 35},
  {url: "p15.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 36},
  {url: "p17.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 37},
  {url: "p16.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 38},
  {url: "r8.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Store", imageable_id: 8},
  {url: "p19.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 40},
  {url: "p20.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 41},
  {url: "p21.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 42},
  {url: "p22.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 43},
  {url: "p23.jpg", alt: nil, image_type: "thumbnail", imageable_type: "Product", imageable_id: 44},
  {url: "b2.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 1},
  {url: "b1.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 2},
  {url: "b3.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 3},
  {url: "b4.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 4},
  {url: "b5.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 5},
  {url: "b6.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 6},
  {url: "b6.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 7},
  {url: "b8.jpg", alt: nil, image_type: "banner", imageable_type: "Store", imageable_id: 8}
])
id = 1
Image.find(id).update_column(:url, "res_1_t.jpg")
id += 1
Image.find(id).update_column(:url, "p1.jpg")
id += 1
Image.find(id).update_column(:url,  "p2.jpg")
id += 1
Image.find(id).update_column(:url, "p3.jpg")
id += 1
Image.find(id).update_column(:url, "p4.jpg")
id += 1
Image.find(id).update_column(:url, "p5.jpg")
id += 1
Image.find(id).update_column(:url, "p6.jpeg")
id += 1
Image.find(id).update_column(:url, "p7.jpeg")
id += 1
Image.find(id).update_column(:url, "p8.jpg")
id += 1
Image.find(id).update_column(:url, "r2_t.jpg")
id += 1
Image.find(id).update_column(:url, "p1.jpg")
id += 1
Image.find(id).update_column(:url, "p2.jpg")
id += 1
Image.find(id).update_column(:url, "p3.jpg")
id += 1
Image.find(id).update_column(:url, "p4.jpg")
id += 1
Image.find(id).update_column(:url, "p5.jpg")
id += 1
Image.find(id).update_column(:url, "p6.jpeg")
id += 1
Image.find(id).update_column(:url, "p1.jpg")
id += 1
Image.find(id).update_column(:url, "p2.jpg")
id += 1
Image.find(id).update_column(:url, "p3.jpg")
id += 1
Image.find(id).update_column(:url, "p4.jpg")
id += 1
Image.find(id).update_column(:url, "p5.jpg")
id += 1
Image.find(id).update_column(:url, "p6.jpeg")
id += 1
Image.find(id).update_column(:url, "r3_t.jpg")
id += 1
Image.find(id).update_column(:url, "r4_t.jpg")
id += 1
Image.find(id).update_column(:url, "p9.jpg")
id += 1
Image.find(id).update_column(:url, "p10.jpg")
id += 1
Image.find(id).update_column(:url, "p11.jpg")
id += 1
Image.find(id).update_column(:url, "p12.jpg")
id += 1
Image.find(id).update_column(:url, "r5_t.jpg")
id += 1
Image.find(id).update_column(:url, "p9.jpg")
id += 1
Image.find(id).update_column(:url, "p10.jpg")
id += 1
Image.find(id).update_column(:url, "p11.jpg")
id += 1
Image.find(id).update_column(:url, "p12.jpg")
id += 1
Image.find(id).update_column(:url, "r6.jpg")
id += 1
Image.find(id).update_column(:url, "p13.jpg")
id += 1
Image.find(id).update_column(:url, "p14.jpg")
id += 1
Image.find(id).update_column(:url, "p15.jpg")
id += 1
Image.find(id).update_column(:url, "p17.jpg")
id += 1
Image.find(id).update_column(:url, "p16.jpg")
id += 1
Image.find(id).update_column(:url, "r7.jpg")
id += 1
Image.find(id).update_column(:url, "p18.jpg")
id += 1
Image.find(id).update_column(:url, "p14.jpg")
id += 1
Image.find(id).update_column(:url, "p14.jpg")
id += 1
Image.find(id).update_column(:url, "p15.jpg")
id += 1
Image.find(id).update_column(:url, "p17.jpg")
id += 1
Image.find(id).update_column(:url, "p16.jpg")
id += 1
Image.find(id).update_column(:url, "r8.jpg")
id += 1
Image.find(id).update_column(:url, "p19.jpg")
id += 1
Image.find(id).update_column(:url, "p20.jpg")
id += 1
Image.find(id).update_column(:url, "p21.jpg")
id += 1
Image.find(id).update_column(:url, "p22.jpg")
id += 1
Image.find(id).update_column(:url, "p23.jpg")
id += 1
Image.find(id).update_column(:url, "b2.jpg")
id += 1
Image.find(id).update_column(:url, "b1.jpg")
id += 1
Image.find(id).update_column(:url, "b3.jpg")
id += 1
Image.find(id).update_column(:url, "b4.jpg")
id += 1
Image.find(id).update_column(:url, "b5.jpg")
id += 1
Image.find(id).update_column(:url, "b6.jpg")
id += 1
Image.find(id).update_column(:url, "b6.jpg")
id += 1
Image.find(id).update_column(:url, "b8.jpg")
id += 1