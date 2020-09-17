class Api::V1::GunsController < ApplicationController

  def index
    personaGuns = Gun.where(:persona_id => [params[:persona_id]])
    guns = Gun.all
    if personaGuns.length === 0
      render json: GunSerializer.new(guns)
    else
      render json: GunSerializer.new(personaGuns)
    end
   
  end



  def create
    gun = Gun.create(gun_params)
    if gun.save
      render json: GunSerializer.new(gun), status: :accepted
    else
      render json: {errors: gun.errors.full_messages, status: :unprocessible_entity}
      
    end

  end

  private

  def member_params
    params.require(:gun).permit(:serial_number, :model, :description)
  end
  
end

# create_table "guns", force: :cascade do |t|
#   t.string "serial_number"
#   t.string "model"
#   t.string "description"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.bigint "persona_id"
#   t.index ["persona_id"], name: "index_guns_on_persona_id"
# end