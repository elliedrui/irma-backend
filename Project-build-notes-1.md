### Priorities
- Authentication + Authorization

### Models
- Member
  - Name
  - Admin Level
  - Pword digest

- Persona
  - First Name
  - Last name
  - DOB
  - Sex
  - Race/Ethnicity
  - member_id
  - faction_id

- Guns
  - Serial Number
  - Model
  - Description
  - persona_id

- Addresses
  - Street Name
  - Street Number
  - Type
  - Has interior?
  - persona_id

- Vehicles
  - year
  - Make
  - Model
  - color
  - plate number
  - persona_id

-Factions
  - Name
  - Acronym
  - Type: GOV/CIV/CRIME
   
  ### Associations
  
  ```ruby
  Member
    has_many :personas
    has_many :guns, through: :personas
    has_many :addresses, through: :personas
    has_many :vehicles, through: :personas
    has_secure_password
    
  Persona
    belongs_to :member
    has_one :faction
    has_many :guns
    has_many :vehicles
    has_many :addresses
    
  Gun
    belongs_to :personas
    has_one :member, through: :personas
    
  Address
    belongs_to :persona
    has_one :member, through: :personas
    # needs validation for no repeat addressess
    
  Vehicle
    belongs_to :persona
    has_one :member, through: :persona
    # can add validation to force no empty fields
    validates :plate_number, presence: :true
  
  Faction
    has_many :personas
    has_many :addresses
    
  ```
  
  ### Seed Data

```ruby
  Member.create(name: 'wayne', admin_level: 1, password: "password")
  Persona.create(first_name: 'Alec', last_name: 'Simms', date_of_birth: "07-27-1985", sex: "male", race: "caucasion", member_id: 2, faction_id: 3)
  Faction.create(name: 'Los Santos Sheriffs Department', acronym: 'LSSD', type: 'GOV') #1
  Vehicle.create(plate_number: '831-TRF', make: 'Chevy', model: 'Silverado', color: 'blue', persona_id: 1)
  Gun.create(serial_num: '123abc', model: "combat pistol, description: 'woodgrain handle, black metal', persona_id: 1)
  Address.create(street_name: 'fake st', street_num: '1234', zip_code: 90210, type: 'apt', has_interior: true, persona_id: 1)
```

### Stretch Goals

  
- Image Upload
- Map display of ingame addresses on live-map


  
  
  
