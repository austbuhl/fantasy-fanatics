class RankingsController < ApplicationController
  before_action :find_ranking, only: [:show, :edit, :update, :destroy]
  before_action :authorized_analyst

  def index
    @rankings = Ranking.all
  end

  def show

  end

  def new
    @ranking = Ranking.new
  end

  def create
    
    params[:rankings][:rankings].each do |rank|
      player = rank[:ranking][:player_id]
      ranking = rank[:ranking][:ranking]
      if !ranking.empty?
        Ranking.create(analyst_id: @current_user.id, player_id: player, ranking: ranking )
      end
    end

    redirect_to rankings_path

  end

  def edit

  end

  def update
    @ranking.update(ranking_params)
  end

  def destroy
    @ranking.destroy
    redirect_to rankings_path
  end

  private

  def find_ranking
    @ranking = Ranking.find(params[:id])
  end

  def ranking_params
    params.require(:rankings).permit({
      rankings: [
        ranking: [
          :player_id,
          :ranking
        ]
      ]
    })
  end
end
