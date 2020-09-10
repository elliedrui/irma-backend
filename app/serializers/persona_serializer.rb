class PersonaSerializer
  
  include FastJsonapi::ObjectSerializer
  belongs_to :member
  attributes :first_name, :last_name, :dob, :sex, :race, :faction, :member, :guns, :notes
  
  
end
