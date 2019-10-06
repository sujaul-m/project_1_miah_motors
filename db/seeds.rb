require_relative( "../models/dealership.rb" )
require_relative( "../models/vehicle.rb" )
require_relative( "../models/miah_motors.rb" )
require("pry-byebug")

MiahMotors.delete_all()
Dealership.delete_all()
Vehicle.delete_all()



dealership1 = Dealership.new({
  "name" => "HR Owen Ferrari",
  "contact" => "0131 629 0342"
})

dealership1.save()

dealership2 = Dealership.new({
  "name" => "Lamborghini Ediburgh",
  "contact" => "0131 900 0491"
})

dealership2.save()

dealership3 = Dealership.new({
  "name" => "Rolls-Royce Motors",
  "contact" => "0131 719 0843"
})

dealership3.save()

dealership4 = Dealership.new({
  "name" => "Bentley Edinburgh",
  "contact" => "0131 991 0113"
})

dealership4.save()

vehicle1 = Vehicle.new({
  "dealership_id" => dealership1.id,
  "make" => "Ferrari",
  "model" => "488 Pista",
  "min_stock" => 3,
  "quantity" => 2,
  "purchase_price" => 251590,
  "selling_price" => 261500,
  "image" => "https://spectrum.ieee.org/image/MzI1NjI1NQ.jpeg"
})

vehicle1.save()

vehicle2 = Vehicle.new({
  "dealership_id" => dealership2.id,
  "make" => "Lamborghini",
  "model" => "Aventador SVJ",
  "min_stock" => 1,
  "quantity" => 2,
  "purchase_price" => 350000,
  "selling_price" => 370000,
  "image" => "https://cdn.motor1.com/images/mgl/LKMJm/s3/lamborghini-aventador-svj.jpg"
})

vehicle2.save()

vehicle3 = Vehicle.new({
  "dealership_id" => dealership3.id,
  "make" => "Rolls-Royce",
  "model" => "Cullinan",
  "min_stock" => 3,
  "quantity" => 1,
  "purchase_price" => 264000,
  "selling_price" => 270000,
  "image" => "https://ovationmagazine.com/wp-content/uploads/2019/08/Rolls-Royce-Cullinan-Black-Badge.jpg"
})

vehicle3.save()

vehicle4 = Vehicle.new({
  "dealership_id" => dealership4.id,
  "make" => "Bentley",
  "model" => "Bentayga Mulliner",
  "min_stock" => 3,
  "quantity" => 5,
  "purchase_price" => 167600,
  "selling_price" => 180000,
  "image" => "https://www.topgear.com/sites/default/files/styles/fit_1960x1102/public/images/news-article/carousel/2017/03/4208383fae449b08d52bf5d639d914fc/636_bentayga_mulliner_front_silverstorm_damson.jpg?itok=eAXjsNZD"
})

vehicle4.save()


showroom1 = MiahMotors.new({
  "vehicle_id" => vehicle1.id
})

showroom1.save()

showroom2 = MiahMotors.new({
  "vehicle_id" => vehicle2.id
})

showroom2.save()

showroom3 = MiahMotors.new({
  "vehicle_id" => vehicle3.id
})

showroom3.save()

showroom4 = MiahMotors.new({
  "vehicle_id" => vehicle4.id
})

showroom4.save()
