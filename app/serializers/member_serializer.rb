class MemberSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :admin_level, :created_at
  has_many :personas
end
