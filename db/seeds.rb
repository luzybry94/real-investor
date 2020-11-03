luzy = User.create(username: "luzybryski", password: "luzy123")
jerry = User.create(username: "jerrylip", password: "atlanta")

Property.create(address: "123 Middlecrest Dr", price: 500000, sqft: 2000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSS8C5rU07-xShyVT68e4vZTtu1ZNm1FE_L7SUm58Fs4MrzGgQ4cnyY1IyTRA&usqp=CAc", score: 7, date: "11/3/20", notes: "promising but needs work")
Property.create(address: "389 Highland Ave", price: 800000, sqft: 2300, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRI88pCsWurphQ-7-wtR6Nfi6OsM5EpUohAIo4gQ-IasMTPV1mhxY36y-Vb-KQ&usqp=CAc", score: 8, date: "11/3/20", notes: "very nice")

luzy.properties.create(address: "2 Beverly Blvd", price: 1000000,  sqft: 2500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSbre-SBDULxQ7bpelcVDuDikVnZ57tRCltv79Leyikt-d580X1eBbEqGef6w&usqp=CAc", score: 5, date: "11/3/20", notes: "look into")
jerry.properties.create(address: "410 Glenridge Dr", price: 1500000,  sqft: 3000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9affn87rYFDzuMGY87gw1SVpW9b8SK78OnEyDDXcVbqipCmoNC4h07VUY&usqp=CAc", score: 8, date: "11/3/20", notes: "cool house")