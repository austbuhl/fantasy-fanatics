class PlayersController < ApplicationController
  def index
    if params[:sort]
      @players = Player.order(params[:sort])
    elsif params[:search]
      search_players
    else
      @players = Player.all
    end
  end

  def search_players
    if @player = Player.all.find{|player| player.name.include?(params[:search])}
      redirect_to player_path(@player)
    end
  end

  def show
    @player = Player.find(params[:id])
  end

end
