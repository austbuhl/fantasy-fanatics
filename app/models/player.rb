class Player < ApplicationRecord
  has_many :player_teams
  has_many :teams, through: :player_teams
  has_many :rankings

  def avg_ranking
    ranking = 0
    avg = 0
    self.rankings.each do |rank|
      ranking += rank.ranking
      avg = 1.0*ranking/self.rankings.count
    end
    avg.round(2)
  end
end
