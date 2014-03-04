fawad_auto = Merchant.create! name: "Fawad's Auto Body Repair", address: "123 Main St, Philadelphia, PA 19103"

jim_coffee = Merchant.create! name: "Jim Coffee and Sandwiches", address: "101 Degas Circle, Philadelphia, PA 19104"

wheel_cap = Item.create! description: "Aluminium Wheel cap", price: 99.95

engine_oil = Item.create! description: "4-cycle engine oil", price: 15.95

cappucino = Item.create! description: "Skinny Cappucino", price: 4.95

mike_purchase_1 = Sale.create! purchaser_name: "Mike Smith", quantity: 4, item: wheel_cap, merchant: fawad_auto

mike_purchase_2 = Sale.create! purchaser_name: "Mike Smith", quantity: 1, item: engine_oil, merchant: fawad_auto

bella_purchase_1 = Sale.create! purchaser_name: "Bella Jones", quantity: 2, item: cappucino, merchant: jim_coffee