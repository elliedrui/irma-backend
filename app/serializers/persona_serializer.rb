class PersonaSerializer
  
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :dob, :sex, :race, :faction
  
  belongs_to :member
end
