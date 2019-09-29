require_relative('../models/supplier')
require_relative('../models/product')
require_relative('../models/customer')
require_relative('../models/order')
require_relative('../models/invoice')
require_relative('../models/shop')
require("pry")


Product.delete_all

supplier1 = Supplier.new({
  "name" => "Bakka",
  "contact_name" => "Mary Macgregor",
  "location" => "Shetland"
})

supplier1.save

supplier2 = Supplier.new({
  "name" => "Essence of Harris",
  "contact_name" => "Jamie McGowan",
  "location" => "Isle of Harris"
})

supplier2.save

supplier3 = Supplier.new({
  "name" => "HP Jewellery",
  "contact_name" => "Hazel Passmore",
  "location" => "Inverness"
})

supplier3.save

product1 = Product.new({
  "supplier_id" => supplier3.id,
  "product_name" => "Silver 'Lace' Brooch Pendant",
  "description" => "Unique silver pendant brooch with 'Lace' textured centre piece framed by a soft, satinised backing. Approx. 8.7 cm x 2.6cm wide.This stunning versatile, statement piece can be worn as a necklace or a broach. There is a double pin on the back and a loop for adding a chain.",
  "stock" =>  3,
  "selling_price" => 195,
  "cost_price" => 156,
  "low_stock_threshold" => 1,
  "delivery_time" => 14
  })

product1.save

product2 = Product.new({
  "supplier_id" => supplier3.id,
  "product_name" => "Silver 'Lace' Bangle",
  "description" => "Unique silver bangle with 'Lace' texture. The bangle is3cm at widest point and varies in thickness from 2.5 - 3cm due to the organic nature of this piece. A T-Bar catch on links secures and complements this bangle.",
  "stock" =>  2,
  "selling_price" => 395,
  "cost_price" => 316,
  "low_stock_threshold" => 1,
  "delivery_time" => 14
  })

product2.save

product3 = Product.new({
  "supplier_id" => supplier2.id,
  "product_name" => "Aurora Glass Candle",
  "description" => "Lavender & Ylang-ylang. Calming and revitalising, Aurora plays with the gentle floral fragrances of soothing lavender and ylang-ylang. 20cl boxed single wick glass candle. Burn time - approx. 30hrs. Height - 80mm. Diameter - 69mm.",
  "stock" =>  20,
  "selling_price" => 13,
  "cost_price" => 10,
  "low_stock_threshold" => 5,
  "delivery_time" => 5
  })

product3.save

product4 = Product.new({
  "supplier_id" => supplier2.id,
  "product_name" => "Seilebost Tin Candle",
  "description" => "Black Pomegranate. A sophisticated, deep and sensual scent with top notes of pomegranate, plum and rose. 20cl single wick tin candle. Height - 65mm. Diameter - 75mm. Burn time - approx. 30hrs.",
  "stock" =>  12,
  "selling_price" => 13,
  "cost_price" => 10,
  "low_stock_threshold" => 5,
  "delivery_time" => 5
  })

product4.save

product5 = Product.new({
  "supplier_id" => supplier1.id,
  "product_name" => "Classic Design Scarf, 2-ply 5-colour",
  "description" => "2-ply 5-colour scarf classic design motifs vary allover. Thick and chunky, it's ideal for someone wanting a bolder look. Approximate size cms: 157 x 25.",
  "stock" =>  5,
  "selling_price" => 210,
  "cost_price" => 168,
  "low_stock_threshold" => 1,
  "delivery_time" => 10
  })

product5.save

product6 = Product.new({
  "supplier_id" => supplier1.id,
  "product_name" => "Reversible Wristwarmers, 5-Colour",
  "description" => "Classic on the outside, contemporary on the inside and vice versa. (except for the seams of course). Approximate size (unstretched) cms: 18.5 x 19.",
  "stock" =>  3,
  "selling_price" => 160,
  "cost_price" => 128,
  "low_stock_threshold" => 1,
  "delivery_time" => 10
  })

product6.save
