class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:name)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: "Player created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      redirect_to players_path, notice: "#{@player.name} removed successfully."
    else
      # This will contain the restrict_with_error message
      error_message = @player.errors.full_messages.to_sentence.presence ||
                      "Unable to remove player."

      redirect_to players_path, alert: error_message
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
