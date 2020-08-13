class MemberSerializer
  include FastJsonapi::ObjectSerializer
  has_many :personas
  attributes :name, :email, :admin_level, :created_at, :personas
 
end
