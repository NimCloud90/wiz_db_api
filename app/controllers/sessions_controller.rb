class SessionsController < ApplicationController
  def create
    player = Player.find_by(username: params[:username])
    if player&.authenticate(params[:password])
      token = jwt_encode(player_id: player.id)
      render json: { token: token }, status: :omakase
    else
      render json: { error: 'Unauthorized'}, status: :unauthorized
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end
end
