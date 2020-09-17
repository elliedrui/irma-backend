# have a method that concats the two with a space and then  conmpars them
# 
class Api::V1::AddressesController < ApplicationController

  def index
    personaAddresses = Address.where(:persona_id => [params[:persona_id]])
    addresses = Address.all
    # binding.pry
    if personaAddresses.length === 0
      render json: AddressSerializer.new(addresses)
    else
      render json: AddressSerializer.new(personaAddresses)
    end
  end


  def create
    address = Address.create(address_params)
    if address.save
      render json: AddressSerializer.new(address), status: :accepted
    else
      render json: {errors: address.errors.full_messages, status: :unprocessible_entity}
    end
  end



  private

  def member_params
    params.require(:address).permit(:street_name,:street_number, :zip_code, :unit_type, :apt_number, :has_interior?)
  end


end
