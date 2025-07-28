class CharacterController < ApplicationController
before_action :authenticate_request

def index
  characters = Character.all

  render json: CharacterBlueprint.render(characters, view: :normal)
end

def create
  character = Character.new(character_params)


  if character.save
    render json: CharacterBlueprint.render(character, view: :normal), status: :created
  else
    render json: character.errors, status: :unprocessable_entity
  end
end

private

def character_params
  params.permit(:name, :role, :perstat, :agstat, :strstat, :intstat, :chastat, :player_id)
end
end
