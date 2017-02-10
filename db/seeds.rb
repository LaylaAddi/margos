fast_food = AddressCategory.where(name: "Pick Up").first_or_create(name: "Pick Up")
seafood = AddressCategory.where(name: "Delivery").first_or_create(name: "Delivery")
steak = AddressCategory.where(name: "P and D").first_or_create(name: "P and D")
chinese = AddressCategory.where(name: "Final Destination").first_or_create(name: "Final Destination")

   States =  
  [
  'Alabama', 
  'Alaska', 
  'Arizona',
  'Arkansas', 
  'California', 
  'Colorado',
  'Connecticut',
  'Delaware', 
  'District of Columbia', 
  'Florida',
  'Georgia',
  'Hawaii', 
  'Idaho', 
  'Illinois', 
  'Indiana', 
  'Iowa', 
  'Kansas', 
  'Kentucky',
  'Louisiana',
  'Maine', 
  'Maryland', 
  'Massachusetts', 
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri', 
  'Montana', 
  'Nebraska', 
  'Nevada',
  'New Hampshire', 
  'New Jersey', 
  'New Mexico', 
  'New York', 
  'North Carolina',
  'North Dakota', 
  'Ohio', 
  'Oklahoma', 
  'Oregon', 
  'Pennsylvania',
  'Puerto Rico', 
  'Rhode Island', 
  'South Carolina', 
  'South Dakota', 
  'Tennessee', 
  'Texas', 
  'Utah', 
  'Vermont',
  'Virginia', 
  'Washington', 
  'West Virginia',
  'Wisconsin', 
  'Wyoming'
  ]
 
    EmploymentStatus =
  [
    "submitted", 
    "pending",
    "approved",
    "declined",
    "active",
    "sick_leave",
    "suspended",
    "vacation",
    "fired"
  ]  

broker_mc = [
  "131029",
  "252947",
  "211123",
  "044128",
  "322572",
  "175953",
  "985484"
  ]
  
dot = [
  "425389",
 "2223295",
  "221569",
 "2211804",
 "2921696"
  ]  

boolean = [
  "true",
  "false"
  ]



city_data = [
  "Chicago. Illinois",
  "Miami, Florida",
  "Toronto, Ontario",
  "Detroit, Michigan",
  "Atlanta, Georgia",
  "New York, New York",
  "Buffalo, New York",
  "Dallas, Texas",
  "Vancouver, British Columbia",
  "Los Angeles, California",
  "San Fransisco, California",
  "Portland, Maine",
  "Nashville, Tennessee",
  "Tampa, Florida",
  "Clevland, Ohio",
  "Niagara Falls, New York",
  "Las Vegas, Nevada",
  "Rapid City, South Dakoda",
  "Casper, Wyoming",
  "Spokane, Washington",
  "Billings, Montana",
  "Green Bay, Wisconsin",
  "Phoenix, Arizona"
  ]
  

steve = CompanyUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: "Steve",
  last_name: "Chesnowtiz",
  email: "steve@margoscargo.com",
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active"
  )
  puts steve.inspect
  
kathy = CompanyUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: "Kathy",
  last_name: "Rodriguez",
  email: "kathy@margoscargo.com",
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active"
  )
  puts kathy.inspect


leadfoot = DriverUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: "Joe The Driver",
  last_name: "Leadfoot",
  email: "leadfoot@margoscargo.com", 
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active",
  company_driver: true,
  driver_rpm: 0.40
  )
  puts leadfoot.inspect
  
  slowmoe = DriverUser.create(
  password: "password",
  password_confirmation: "password", 
  first_name: "Slow",
  last_name: "Moe",
  email: "slowmoe@margoscargo.com", 
  cellphone: "7169864010",  
  street: Faker::Address.street_name,
  telephone: Faker::PhoneNumber.phone_number,
  city: city_data.sample,
  zip: "123456",
  emergency_contact: Faker::Name.first_name,
  emergency_contact_number: Faker::PhoneNumber.phone_number,
  dispatcher: "true",
  admin: "true",
  employment_status: "active",
  owner_operator: true,
  driver_rpm: 0.00
  )
  puts slowmoe.inspect
   
  
# 10.times do
# hrcuser = HrcUser.create(
#   password: "password",
#   password_confirmation: "password", 
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   cellphone: "7169864010",  
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   office: "false",
#   maintenance: "false",
#   shipping_receiving: "false",
#   dispatcher: "true",
#   admin: "false"
#   )
#   puts hrcuser.inspect
# end
# 50.times do
# driver = DriverUser.create(
# password: "password",
#   password_confirmation: "password", 
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   cellphone: Faker::PhoneNumber.phone_number,  
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   employment_status: EmploymentStatus.sample
#   )
#   puts driver.inspect
# end

# 10.times do
# shipperuser = ShipperUser.create(
#   password: "password",
#   password_confirmation: "password", 
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   email: Faker::Internet.email,
#   cellphone: "7169864010",  
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   dispatcher: boolean.sample,
#   office: boolean.sample,
#   maintenance: boolean.sample,
#   shipping_receiving: boolean.sample
#   )
#   puts shipperuser.inspect
# end


3.times do     
companyprofile = CompanyProfile.create!(
company_name: Faker::Company.name, 
telephone: Faker::PhoneNumber.phone_number,
street: Faker::Address.street_address,
city: "CityVille",
state: States.sample,
zip: Faker::Address.zip,
fax: Faker::PhoneNumber.phone_number,
contact: Faker::Name.first_name, 
website: Faker::Internet.url,
broker_mc_number: "985484",
carrier_mc_number: "985484",
us_dot_number: "2921696",
email: Faker::Internet.email
  )
puts companyprofile.inspect
end

# hrcprofile = CompanyProfile.create!(
# company_name: "HRC Logistics LLC", 
# telephone: "4693012226",
# street: "14241 Dallas Parkway Suite 650",
# city: "Dallas",
# state: "Texas",
# zip: "75254",
# fax: "469.301.2226",
# contact: "Kathy", 
# website: "hrclogistics.com",
# broker_mc_number: "985484",
# carrier_mc_number: "985484",
# us_dot_number: "2921696",
# email: "support@hrclogistics.com"
# )



# driver1 = HrcUser.create(
# password: "password",
#   password_confirmation: "password", 
#   first_name: "Kathy",
#   last_name: "Bums",
#   email: "ss.chesnowitz@gmail.com", 
#   cellphone: "+17169864324",   
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   employment_status: "active",
#   company_driver: true,
#   driver_rpm: 0.40
# )
#   puts driver1.inspect

# driver2 = DriverUser.create(
# password: "password",
#   password_confirmation: "password", 
#   first_name: "Steve C",
#   last_name: "Chezzie",
#   email: "ksathystevemail@gmail.com",
#   cellphone: "+17169864010",  
#   street: Faker::Address.street_name,
#   telephone: Faker::PhoneNumber.phone_number,
#   city: city_data.sample,
#   zip: "123456",
#   emergency_contact: Faker::Name.first_name,
#   emergency_contact_number: Faker::PhoneNumber.phone_number,
#   employment_status: "active",
#   owner_operator: true,
#   driver_rpm: 0.00 
# )
#   puts driver2.inspect
  
  
  
  
  
# 3.times do |j|
#   number = "447555555#{rand(100..999)}"

#   3.times do |i|
#     Message.create!(
#       number: number,
#       text: Faker::Hipster.paragraph(1),
#       inbound: Faker::Boolean.boolean,
#       created_at: (i+j).hours.ago
#     )
#   end
# end

DriverCheckin.create(
  #Toronto
  driver_user_id: 3,
  latitude: 43.761539,
  longitude: -79.411079,
  notes: "Toronto"
  )    

  
# DriverCheckin.create(
#   #detroit
#   driver_user_id: 3,
#   latitude: 42.331429,
#   longitude: -83.045753,
#   notes: "detroit"
#   )    
  
# DriverCheckin.create(
#   #cleveland
#   driver_user_id: 3,
#   latitude: 41.505493,
#   longitude: -81.681290,
#   notes: "cleveland"
#   )    
  
# DriverCheckin.create(
#   #pitsburgh
#   driver_user_id: 3,
#   latitude: 40.442532,
#   longitude: -79.960175,
#   notes: "pitsburgh"
#   )      
  

  
  
  
  
# DriverCheckin.create(driver_user_id: 3, notes: "Cheektowaga, NY, USA",	    latitude: 42.902615, longitude:	-78.744576)
# DriverCheckin.create(driver_user_id: 3, notes: "Eldorado Springs, CO",     	latitude: 39.932117, longitude:	-105.281639)
# DriverCheckin.create(driver_user_id: 3, notes: "Twin Falls, Idaho",    	    latitude: 42.562786, longitude:	-114.460503)
# DriverCheckin.create(driver_user_id: 3, notes: "Huntington, WV, USA",	      latitude: 38.413651, longitude:	-82.446732)
# DriverCheckin.create(driver_user_id: 3, notes: "Danbury, CT, USA",	        latitude: 41.394966, longitude:	-73.454079)
# DriverCheckin.create(driver_user_id: 3, notes: "New Haven, CT, USA"	,       latitude: 41.308273, longitude:	-72.927887)
# DriverCheckin.create(driver_user_id: 3, notes: "Nampa, Idaho, USA",	        latitude: 43.565468, longitude:	-116.560822)
# DriverCheckin.create(driver_user_id: 3, notes: "New Iberia, LA, USA",	      latitude: 30.005417, longitude:	-91.818665)
# DriverCheckin.create(driver_user_id: 3, notes: "Wilkes-Barre, PA",     	    latitude: 41.245708, longitude:	-75.881241)
# DriverCheckin.create(driver_user_id: 3, notes: "Petersburg, VA, USA",	      latitude: 37.227928, longitude:	-77.401924)
# DriverCheckin.create(driver_user_id: 3, notes: "Grand Rapids, MI",     	    latitude: 42.963795, longitude:	-85.670006)
# DriverCheckin.create(driver_user_id: 3, notes: "Lexington, Kentucky, US",	  latitude: 38.047989, longitude:	-84.501640)
# DriverCheckin.create(driver_user_id: 3, notes: "Hamden, CT, USA",	          latitude: 41.385826, longitude:	-72.904243)
# DriverCheckin.create(driver_user_id: 3, notes: "Moscow, Idaho, USA",	      latitude: 46.731705, longitude:	-116.999939)
# DriverCheckin.create(driver_user_id: 3, notes: "Pine Bluff, AR",           	latitude: 34.224400, longitude:	-92.019211)
# DriverCheckin.create(driver_user_id: 3, notes: "Tuba City, Arizona",     	  latitude: 36.136906, longitude:	-111.240173)
# DriverCheckin.create(driver_user_id: 3, notes: "Medford, OR, USA",	        latitude: 42.326515, longitude:	-122.875595)
# DriverCheckin.create(driver_user_id: 3, notes: "Franklin, TN, USA",	        latitude: 35.925064, longitude:	-86.868889)
# DriverCheckin.create(driver_user_id: 3, notes: "Portland, OR, USA",	        latitude: 45.523064, longitude:	-122.676483)
# DriverCheckin.create(driver_user_id: 3, notes: "Philadelphia, PA, USA",	    latitude: 39.952583, longitude:	-75.165222)
# DriverCheckin.create(driver_user_id: 3, notes: "Miami, FL, USA"	,           latitude: 25.761681, longitude:	-80.191788)
# DriverCheckin.create(driver_user_id: 3, notes: "Boston, MA, USA",	          latitude: 42.361145, longitude:	-71.057083)
# DriverCheckin.create(driver_user_id: 3, notes: "Phoenix, AZ, USA",	        latitude: 33.448376, longitude:	-112.074036)
# DriverCheckin.create(driver_user_id: 3, notes: "Erie, PA, USA",	            latitude: 42.129223, longitude:	-80.085060)
# DriverCheckin.create(driver_user_id: 3, notes: "Victorville, CA, USA",	    latitude: 34.536217, longitude:	-117.292763)
# DriverCheckin.create(driver_user_id: 3, notes: "Wilmington, DE, USA",	      latitude: 39.739071, longitude:	-75.539787)
# DriverCheckin.create(driver_user_id: 3, notes: "Fontana, CA, USA",	        latitude: 34.092232, longitude:	-117.435051)
# DriverCheckin.create(driver_user_id: 3, notes: "Jacksonville, FL, USA",	    latitude: 30.332184, longitude:	-81.655647)
# DriverCheckin.create(driver_user_id: 3, notes: "Soulsbyville, CA, USA",	    latitude: 37.984646, longitude:	-120.263802)
# DriverCheckin.create(driver_user_id: 3, notes: "Corvallis, OR, USA",	      latitude: 44.564568, longitude:	-123.262047)
# DriverCheckin.create(driver_user_id: 3, notes: "Des Plaines, IL, USA",     	latitude: 42.033363, longitude:	-87.883400)
# DriverCheckin.create(driver_user_id: 3, notes: "Richmond, CA, USA",	        latitude: 37.935757, longitude:	-122.347748)
# DriverCheckin.create(driver_user_id: 3, notes: "Grifton, NC, USA",	        latitude: 35.372662, longitude:	-77.437462)
# DriverCheckin.create(driver_user_id: 3, notes: "Redmond, WA, USA",	        latitude: 47.673988, longitude:	-122.121513)
# DriverCheckin.create(driver_user_id: 3, notes: "San Leandro, Oakland, CA", 	latitude: 37.725685, longitude:	-122.156830)
# DriverCheckin.create(driver_user_id: 3, notes: "Russellville, AL, USA",	    latitude: 34.501942, longitude:	-87.731789)
# DriverCheckin.create(driver_user_id: 3, notes: "Dothan, AL, USA",	          latitude: 31.223812, longitude:	-85.393356)
# DriverCheckin.create(driver_user_id: 3, notes: "Tampa, FL, USA",	          latitude: 27.964157, longitude:	-82.452606)
# DriverCheckin.create(driver_user_id: 3, notes: "Kenosha, WI, USA",	        latitude: 42.588081, longitude:	-87.822899)
# DriverCheckin.create(driver_user_id: 3, notes: "Springfield, OR, USA",	    latitude: 44.046204, longitude:	-123.023346)
# DriverCheckin.create(driver_user_id: 3, notes: "Revere, MA, USA",	          latitude: 42.408428, longitude:	-71.011993)
# DriverCheckin.create(driver_user_id: 3, notes: "New Haven, CT, USA",	      latitude: 41.310726, longitude:	-72.929916)
# DriverCheckin.create(driver_user_id: 3, notes: "Port Orange, FL",    	      latitude: 29.138315, longitude:	-80.995613)
# DriverCheckin.create(driver_user_id: 3, notes: "Manhattan, KS, USA",	      latitude: 39.183609, longitude:	-96.571671)
# DriverCheckin.create(driver_user_id: 3, notes: "Baldwin Park, CA",     	    latitude: 34.085285, longitude:	-117.960899)



DriverCheckin.create(driver_user_id: 3, notes: "Rochester",	    latitude: 43.161030, longitude:	-77.610924)
DriverCheckin.create(driver_user_id: 3, latitude: 41.505493, longitude: -81.681290, notes: "cleveland")  
DriverCheckin.create(driver_user_id: 3, latitude: 40.442532, longitude: -79.960175,  notes: "pitsburgh" )   

DriverCheckin.create(driver_user_id: 3, notes: "Washington",     	latitude: 38.889931, longitude:	-77.009003)

DriverCheckin.create(driver_user_id: 3, notes: "Richmond VA",    	    latitude: 37.646152, longitude:	-77.511429)
DriverCheckin.create(driver_user_id: 3, notes: "Norfolk VA",	      latitude: 36.8507689 , longitude:	-76.2858726)
DriverCheckin.create(driver_user_id: 3, notes: "Charlotte, NC, USA", latitude: 35.227085, longitude: -80.843124)
DriverCheckin.create(driver_user_id: 3, notes: "Charleston, South Carolina, USA", latitude: 32.784618, longitude: -79.940918 )
DriverCheckin.create(driver_user_id: 3, notes: "Savannah, GA, USA", latitude: 32.076176,  longitude: -81.088371)
DriverCheckin.create(driver_user_id: 3,latitude: 30.332184,longitude: -81.655647,notes: "jacksonville") 



AppVariable.create(
app_name: "Acme App Name",
app_logo: "",
app_logo_text: "Logo Name",
app_tab_text: "Tab Name",
app_slogan: "ACME Slogan",
app_favi: "",
app_terms: "TERMS  Lorem ipsum dolor sit amet, sed ex stet aperiam, ut sensibus assentior vituperata est. Ius an error partiendo democritum. Eros mediocrem ne usu, ea omnium saperet qui. Graecis torquatos reformidans cum et.

Sensibus adversarium ad per, ius commodo placerat omittantur cu. Ea qui homero recteque, nisl veniam sit ad. Sonet dignissim ad eum, fugit doctus per in. In duo possim oblique expetendis, ex eos forensibus elaboraret. Mei verterem suscipiantur ea, ne dico quidam sed.

Sumo molestiae dissentiunt eam te, pro ea oporteat recteque. Stet antiopam perpetua ius ad. Mucius impetus eu has, vix debitis invenire voluptatum id. His cu ludus lobortis gloriatur, ut vim vide mediocritatem. Est cu vide posse vocent.

Elit nobis offendit in ius, quo ludus dolor ullamcorper ei, ex his quis utamur. An pri utroque inimicus, esse accusata at mel. Ludus ceteros sit et, consul ridens pro in, id tollit vocibus pri. At his lobortis invenire, id habemus imperdiet vis.

Pro ne quem affert, pri no mundi deserunt neglegentur. Nec nulla affert in. Solum latine ne nec. Sea dicit legendos id, no veritus moderatius efficiantur per. Libris aliquam cu ius, graece omittam ei usu. Vix elit dicant semper an, eam eu luptatum quaerendum eloquentiam.",
app_conditions: " CONDItions Lorem ipsum dolor sit amet, sed ex stet aperiam, ut sensibus assentior vituperata est. Ius an error partiendo democritum. Eros mediocrem ne usu, ea omnium saperet qui. Graecis torquatos reformidans cum et.

Sensibus adversarium ad per, ius commodo placerat omittantur cu. Ea qui homero recteque, nisl veniam sit ad. Sonet dignissim ad eum, fugit doctus per in. In duo possim oblique expetendis, ex eos forensibus elaboraret. Mei verterem suscipiantur ea, ne dico quidam sed.

Sumo molestiae dissentiunt eam te, pro ea oporteat recteque. Stet antiopam perpetua ius ad. Mucius impetus eu has, vix debitis invenire voluptatum id. His cu ludus lobortis gloriatur, ut vim vide mediocritatem. Est cu vide posse vocent.

Elit nobis offendit in ius, quo ludus dolor ullamcorper ei, ex his quis utamur. An pri utroque inimicus, esse accusata at mel. Ludus ceteros sit et, consul ridens pro in, id tollit vocibus pri. At his lobortis invenire, id habemus imperdiet vis.

Pro ne quem affert, pri no mundi deserunt neglegentur. Nec nulla affert in. Solum latine ne nec. Sea dicit legendos id, no veritus moderatius efficiantur per. Libris aliquam cu ius, graece omittam ei usu. Vix elit dicant semper an, eam eu luptatum quaerendum eloquentiam."
)
