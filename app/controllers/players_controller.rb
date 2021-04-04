class PlayersController < ApplicationController
  def index
    if params[:search]
      search_players
    elsif params[:sort] == "avg_ranking" && params[:order] == "ASC"
      @players = Player.all.sort_by{|player| player.avg_ranking}
      params[:order] = "DESC"

    elsif params[:sort] == "avg_ranking" && params[:order] == "DESC"
      @players = Player.all.sort_by{|player| player.avg_ranking}.reverse
      params[:order] = "ASC"

    elsif params[:sort] != "avg_ranking" && params[:order] == "ASC"
      @players = Player.order(params[:sort])
      params[:order] = "DESC"

    elsif params[:sort] != "avg_ranking" && params[:order] == "DESC"
      @players = Player.order(params[:sort]).reverse
      params[:order] = "ASC"
    else
      @players = Player.all
    end
  end

  def search_players
    if @player = Player.all.find{|player| player.name.include?(params[:search])}
      redirect_to player_path(@player)
    else
      redirect_to players_path
      flash[:message] = "Player Not Found"
    end
  end

  def show
    @player = Player.find(params[:id])
  end

end
