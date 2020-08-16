class Api::V1::PersonasController < ApplicationController

  def index
    
    personas = Persona.all
   
    render json: PersonaSerializer.new(personas)
  end

  def create
    persona = Persona.create(persona_params)
    if persona.save
      render json: PersonaSerializer.new(persona), status: :accepted
    else
      render json: {errors: persona.errors.full_messages, status: :unprocessible_entity}
    end

  end



  private

  def persona_params
    params.require(:persona).permit(:first_name, :last_name, :dob, :sex, :race, :member_id, :faction_id)
  end

end
