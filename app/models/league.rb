class League < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :owners, through: :teams


  def rostered_players
    players = []

    self.teams.each do |team|
      team.players.each do |player|
        players << player
      end
    end
    players
  end

  def available_players
    roster = self.rostered_players 
    available = []

    Player.all.each do |player|
      if !roster.include?(player)
        available << player
      end
    end
    available
  end



end
