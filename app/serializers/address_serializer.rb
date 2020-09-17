class AddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :street_name,:street_number, :zip_code, :unit_type, :apt_number, :has_interior?, :persona
end
