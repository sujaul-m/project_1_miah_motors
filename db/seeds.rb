require_relative( "../models/manufacturer.rb" )
require_relative( "../models/vehicle.rb" )
require_relative( "../models/miah_motors.rb" )
require("pry-byebug")

MiahMotors.delete_all()
Manufacturer.delete_all()
Vehicle.delete_all()



manufacturer1 = Manufacturer.new({
  "name" => "HR Owen Ferrari",
  "contact" => "0131 629 0342"
})

manufacturer1.save()

manufacturer2 = Manufacturer.new({
  "name" => "Lamborghini Ediburgh",
  "contact" => "0131 900 0491"
})

manufacturer2.save()

manufacturer3 = Manufacturer.new({
  "name" => "Rolls-Royce Motors",
  "contact" => "0131 719 0843"
})

manufacturer3.save()

manufacturer4 = Manufacturer.new({
  "name" => "Bentley Edinburgh",
  "contact" => "0131 991 0113"
})

manufacturer4.save()

vehicle1 = Vehicle.new({
  "make" => "Ferrari",
  "model" => "488 Pista",
  "quantity" => 5,
  "purchase_price" => 25159000,
  "selling_price" => 26150000,
  "image" => "https://spectrum.ieee.org/image/MzI1NjI1NQ.jpeg"
})

vehicle1.save()

vehicle2 = Vehicle.new({
  "make" => "Lamborghini",
  "model" => "Aventador SVJ",
  "quantity" => 2,
  "purchase_price" => 35000000,
  "selling_price" => 37000000,
  "image" => "https://cdn.motor1.com/images/mgl/LKMJm/s3/lamborghini-aventador-svj.jpg"
})

vehicle2.save()

vehicle3 = Vehicle.new({
  "make" => "Rolls-Royce",
  "model" => "Cullinan",
  "quantity" => 3,
  "purchase_price" => 26400000,
  "selling_price" => 27000000,
  "image" => "https://ovationmagazine.com/wp-content/uploads/2019/08/Rolls-Royce-Cullinan-Black-Badge.jpg"
})

vehicle3.save()

vehicle4 = Vehicle.new({
  "make" => "Bentley",
  "model" => "Bentayga Mulliner",
  "quantity" => 5,
  "purchase_price" => 16760000,
  "selling_price" => 18000000,
  "image" => "https://www.topgear.com/sites/default/files/styles/fit_1960x1102/public/images/news-article/carousel/2017/03/4208383fae449b08d52bf5d639d914fc/636_bentayga_mulliner_front_silverstorm_damson.jpg?itok=eAXjsNZD"
})

vehicle4.save()


showroom1 = MiahMotors.new({
  "vehicle_id" => vehicle1.id,
  "manufacturer_id" => manufacturer1.id
})

showroom1.save()

showroom2 = MiahMotors.new({
  "vehicle_id" => vehicle2.id,
  "manufacturer_id" => manufacturer2.id
})

showroom2.save()

showroom3 = MiahMotors.new({
  "vehicle_id" => vehicle3.id,
  "manufacturer_id" => manufacturer3.id
})

showroom3.save()

showroom4 = MiahMotors.new({
  "vehicle_id" => vehicle4.id,
  "manufacturer_id" => manufacturer4.id
})

showroom4.save()
