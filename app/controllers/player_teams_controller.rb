class PlayerTeamsController < ApplicationController
  def new
    @player_team = Player.new
  end

  def create
    @player_team = PlayerTeam.create
  end
end
