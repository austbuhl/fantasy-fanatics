class PlayerTeamsController < ApplicationController
  def new
    @player_team = Player.new
  end

  def create
    @player_team = PlayerTeam.create
  end

  def destroy
    dropped_player = PlayerTeam.find_by(team: params[:team], player: params[:id])
    flash[:dropped] = "Dropped #{Player.find(params[:id]).name}"
    dropped_player.destroy

    
    redirect_to team_path(params[:team])
  end
end
