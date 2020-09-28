class RankingsController < ApplicationController
  before_action :find_ranking, only: [:show, :edit, :update, :destroy]

  def index
    @rankings = Ranking.all
  end

  def show
  
  end

  def new
    @ranking = Ranking.new
  end

  def create
    ranking = Ranking.create(ranking_params)
    if ranking.valid?
      redirect_to ranking_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @ranking.update(ranking_params)
  end

  def destroy
    @ranking.destroy
  end

  private

  def find_ranking
    @ranking = Ranking.find(params[:id])
  end

  def ranking_params
    params.permit(:ranking).require(:analyst_id, :player_id)
  end
end
