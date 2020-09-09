class Api::V1::MembersController < ApplicationController
  
  def index
    members = Member.all
    render json: MemberSerializer.new(members)
  end

  def create
    member = Member.create(member_params)
    if member.save
      render json: MemberSerializer.new(member), status: :accepted
    else
      render json: {errors: member.errors.full_messages, status: :unprocessible_entity}
      
    end

  end



  private

  def member_params
    params.require(:member).permit(:name, :email, :admin_level, :password, :uid)
  end


end
