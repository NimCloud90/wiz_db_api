class ApplicationController < ActionController::API
  def index
  character = Character.all
  render json: character

  player = Player.all
  render json: player
  end

  def show
    character = Character.find(params[:id])
    render json: character

    player = Player.find(params[:id])
    render json: player
  end


def create 
  character = Character.create(character_params)
  render json: character

  player = Player.create(player_params)
  render json: player
end

private
def character_params
  params.permit(:name, :role, :perstat, :agstat, :intstat, :chastat)
end

def player_params
  params.permit(:username, :password)
end

def destroy
  character = Character.find(params[:id])
  character.destroy
  render json: character

  player = Player.find(params[:id])
  player.destroy
  render json: player
end

def authenticate_request
  header = request.headers['Authorization']
  header = header.split(' ').last if header
  begin
    decoded = JWT.decode(header, Rails.application.credentials.secret_key_base).first
    @current_player = Player.find(decoded['user_id'])
  rescue JWT::ExpiredSignature
    render json: { error: 'Token has expired'}, status: :unauthorized
  rescue JWT::DecodeError
    render json: { errors: 'Unauthorized'}, status: :unauthorized
  end
end
end