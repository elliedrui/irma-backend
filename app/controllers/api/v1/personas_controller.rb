class Api::V1::PersonasController < ApplicationController

  def index
    options = {}
    options[:include] = [:member, :'member.name']
    personas = Persona.all
    render json: PersonaSerializer.new(personas, options)
  end

  def create
    persona = Persona.new(:first_name, :last_name, :dob, :sex, :race, :member, :faction)
    if persona.save
      render json: PersonaSerializer.new(persona), status: :accepted
    else
      render json: {errors: persona.errors.full_messages}, status: :unprocessible_entity
    end

  end



  private

  def persona_params(*args)
    params.require(:persona).permit(*args)
  end

end
