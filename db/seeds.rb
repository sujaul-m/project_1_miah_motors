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
  "purchase_price" => 25159000,
  "selling_price" => 26150000
})

vehicle1.save()

vehicle2 = Vehicle.new({
  "make" => "Lamborghini",
  "model" => "Aventador SVJ",
  "purchase_price" => 35000000,
  "selling_price" => 37000000
})

vehicle2.save()

vehicle3 = Vehicle.new({
  "make" => "Rolls-Royce",
  "model" => "Cullinan",
  "purchase_price" => 26400000,
  "selling_price" => 27000000
})

vehicle3.save()

vehicle4 = Vehicle.new({
  "make" => "Bentley",
  "model" => "Bentayga Mulliner",
  "purchase_price" => 16760000,
  "selling_price" => 18000000
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
