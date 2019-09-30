require_relative('../models/supplier')
require_relative('../models/product')
require_relative('../models/customer')
require_relative('../models/order')
require_relative('../models/invoice')
require_relative('../models/shop')
require("pry")


Order.delete_all
Product.delete_all
Invoice.delete_all
Customer.delete_all
Supplier.delete_all
Shop.delete_all


shop1 = Shop.new({
  "shop_name" => "Spirit of Scotland"
  })

shop1.save

supplier1 = Supplier.new({
  "supplier_name" => "Bakka",
  "contact_name" => "Mary Macgregor",
  "location" => "Orkney"
})

supplier1.save

supplier2 = Supplier.new({
  "supplier_name" => "Essence of Harris",
  "contact_name" => "Jamie McGowan",
  "location" => "Isle of Harris"
})

supplier2.save

supplier3 = Supplier.new({
  "supplier_name" => "HP Jewellery",
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
  "delivery_time" => 14,
  "category" => "Jewellery"
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
  "delivery_time" => 14,
  "category" => "Jewellery"
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
  "delivery_time" => 5,
  "category" => "Candles"
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
  "delivery_time" => 5,
  "category" => "Candles"
  })

product4.save

product5 = Product.new({
  "supplier_id" => supplier1.id,
  "product_name" => "Classic Design Scarf",
  "description" => "2-ply 5-colour scarf classic design motifs vary allover. Thick and chunky, it's ideal for someone wanting a bolder look. Approximate size cms: 157 x 25.",
  "stock" =>  5,
  "selling_price" => 210,
  "cost_price" => 168,
  "low_stock_threshold" => 1,
  "delivery_time" => 10,
  "category" => "Knitwear"
  })

product5.save

product6 = Product.new({
  "supplier_id" => supplier1.id,
  "product_name" => "Reversible Wristwarmers, classic design",
  "description" => "Classic on the outside, contemporary on the inside and vice versa (except for the seams of course). 5 colours. Approximate size (unstretched) cms: 18.5 x 19.",
  "stock" =>  3,
  "selling_price" => 160,
  "cost_price" => 128,
  "low_stock_threshold" => 1,
  "delivery_time" => 10,
  "category" => "Knitwear"
  })

product6.save

customer1 = Customer.new({
  "first_name" => "Jo",
  "last_name" => "Blog",
  "address_1" => "17 Hogwarts lane",
  "address_2" => "",
  "postcode" => "AB2 3CD",
  "town_city" => "Aberdeen"
  })

customer1.save

customer2 = Customer.new({
  "first_name" => "Marissa",
  "last_name" => "Jones",
  "address_1" => "28 Chapel Street",
  "address_2" => "",
  "postcode" => "IV2 4DB",
  "town_city" => "Inverness"
  })

customer2.save

customer3 = Customer.new({
  "first_name" => "Jim",
  "last_name" => "Harper",
  "address_1" => "62 Fleetstreet",
  "address_2" => "",
  "postcode" => "E1 6AN",
  "town_city" => "London"
  })

customer3.save

customer4 = Customer.new({
  "first_name" => "Dylan",
  "last_name" => "Maple",
  "address_1" => "23 Gorge Road",
  "address_2" => "",
  "postcode" => "CD12UU",
  "town_city" => "Manchester"
  })

customer4.save

customer5 = Customer.new({
  "first_name" => "Alayna",
  "last_name" => "Robins",
  "address_1" => "45 Market Square",
  "address_2" => "",
  "postcode" => "ER3 4KK",
  "town_city" => "Harrogate"
  })

customer5.save

customer6 = Customer.new({
  "first_name" => "Oscar",
  "last_name" => "Manley",
  "address_1" => "36 High Street",
  "address_2" => "",
  "postcode" => "JK1 7KM",
  "town_city" => "Smalltown"
  })

customer6.save

order1 = Order.new({
  "product_id" => product1.id,
  "customer_id" => customer1.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-13 16:00:00"
  })

order1.save

order2 = Order.new({
  "product_id" => product2.id,
  "customer_id" => customer2.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-12 08:00:00"
  })

order2.save

order3 = Order.new({
  "product_id" => product3.id,
  "customer_id" => customer3.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-16 13:30:00"
  })

order3.save

order4 = Order.new({
  "product_id" => product4.id,
  "customer_id" => customer3.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-28 13:10:00"
  })

order4.save

order5 = Order.new({
  "product_id" => product5.id,
  "customer_id" => customer1.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-28 13:00:00"
  })

order5.save

order6 = Order.new({
  "product_id" => product6.id,
  "customer_id" => customer4.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-28 13:00:00"
  })

order6.save

order7 = Order.new({
  "product_id" => product2.id,
  "customer_id" => customer5.id,
  "quantity" =>  2,
  "date_ordered" => "2019-09-18 15:00:00"
  })

order7.save

order8 = Order.new({
  "product_id" => product3.id,
  "customer_id" => customer6.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-15 12:25:00"
  })

order8.save

order9 = Order.new({
  "product_id" => product2.id,
  "customer_id" => customer3.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-24 13:00:00"
  })

order9.save

order10 = Order.new({
  "product_id" => product1.id,
  "customer_id" => customer4.id,
  "quantity" =>  1,
  "date_ordered" => "2019-09-24 13:00:00"
  })

order10.save

Supplier.all
supplier2.find
supplier1.location = "Shetland"
supplier1.update

Customer.all
customer2.find
customer2.last_name = "Smith"
customer2.update


Order.all
Product.all
Customer.all

# invoice3.find
# invoice3.update
# invoice3.pay

# invoice1.invoice_total = 30
# Invoice.update(invoice1)
# invoice1.update(250)
# customer3.orders
#
# customer3.invoices
# customer3.invoice?
#
# customer1.check_out(order1, shop1)
# customer2.check_out(order2, shop1)
#
# invoice2.pay(shop1)
# invoice1.pay(shop1)



# binding.pry
# order1.check_out

# order1.find
# order1.find_selling_price
# order1.value
# order1.update_status
# order1.find_invoice_total
