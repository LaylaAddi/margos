module Dropdown
  extend ActiveSupport::Concern   



CompanyProfileMembershipStatus =
[ 
  
  "Member",
  "Non Member"
]
  
  PickupTimeNotes =
  [
    "Appointment Booked At"
  ]
  
  DeliveryTimeNotes =
  [
    "Appointment Booked At",
    "Multiple Deliveries",
    "Appointments with Multiple Deliveries"
  ]
     
  

  LoadSize =
  [
    "FTL",
    "LTL"
   ]
   
  AddressType =
  
  [ 
    "Destination",
    "Origin"
  ]
  
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
  'Wyoming',
  "Ontario",
  "British Colombia"
  ]

      
    EmploymentStatus =
  [

    ["active", "active"],
    ["not_active", "not_active"]
  ]  
  
    DeliveryStatus =
  [
    ["Waiting For Load"],    
    ["Driving to Pick Up"],
    ["At Pick Up - Waiting"],
    ["At Pick Up - Loading"],
    ["Driving to Deliver"],
    ["At Delivery - Waiting"],
    ["At Delivery - Unloading"],
    ["Off Duty"]
  ]    
  
  OfficeLocation =  
  [
    ["Buffalo"],
    ["Dallas"]
  ]     
    

  
    Yard = 
  [
    ['Buffalo', 'Buffalo'],
    ['Miami', 'Miami'],
    ['Dallas', 'Dallas'],
    ['Los Angeles', 'Los Angeles']
  ] 
  
  TruckStatus =   
  [
    ['Parked', 'Parked'],
    ['In Shop', 'In Shop'],
    ['Active', 'Active'],
    ['Not Known', 'Not Known'] 
  ]
  

  ExpenseType =   
  [
    ['Fuel', 'Fuel'],
    ['Cash Advance', 'Cash Advance'],
    ['Booking Fee', 'Booking Fee'],
    ['Other', 'Other'] 
  ]    
  
    EquipmentType =   
  [
    ['Van', 'Van'],
    ['Flatbed', 'Flatbed'],
    ['Reefer', 'Reefer'],
    ['RGN', 'RGN'],
    ['Other', 'Other']    
  ]     
  
  
  LoadStatusStatus =
  [
    ["Active", "Active" ],
    ["Pending", "Pending" ],
    ["Complete", "Complete" ],
    ["Cancelled", "Cancelled" ]
  ]
  
  DriverStatementPayment =
  [
    ["Paid", "Paid" ],
    ["Not Paid", "Not Paid" ],
    ["Void", "Void" ]
  ]
  
  
  LoadDocumentType =
  [
    ["Load Confirmation", "Load Confirmation"],
    ["BOL", "BOL"],
    ["Other", "Other"]
  ]
  
  TruckTrailerStatus =
  [
    ["In Service", "In Service"],
    ["Not In Service", "Not In Service"]
  ]

 
 DriverRpm =
    [
    ["0.00", "0.00"], 
        ["0.35", "0.35"],
                ["0.36", "0.36"]
   
    ]
    
  DriverRpm2 =
    [
    0.00, 
    0.15,
    0.20,
    0.25,
    0.30,
    0.32,  
    0.48
    ]
    
 PickupDelivery =
    [
    ["Pick Up", "PU" ],
    ["Delivery", "D" ],
    ["Pick Up/Delivery", "PUD" ],  
    ["Final Destination", "FD" ] 
    ]

Theme = 
[    
["Cerulean", "Cerulean"],
["Cosmo", "Cosmo"],
["Cyborg", "Cyborg"],
["Darkly", "Darkly"], 
["Flatly", "Flatly"],
["Journal", "Journal"],
["Lumen", "Lumen"],
["Paper", "Paper"],
["Readable", "Readable"],
["Sandstone", "Sandstone"],
["Simplex", "Simplex"],
["Slate", "Slate"],
["Spacelab", "Spacelab"],
["Superhero", "Superhero"],
["United", "United"],
["Yeti", "Yeti"]
]

FeColor = 
[    
["Red", "Red"],
["Teal", "Teal"],
["Cyborg", "Cyborg"],
["Darkly", "Darkly"]
]
end

