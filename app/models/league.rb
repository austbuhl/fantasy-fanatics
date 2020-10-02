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

  def random_logo
    logos = ["https://www.flaticon.com/svg/static/icons/svg/2997/2997120.svg", 
              "https://www.flaticon.com/svg/static/icons/svg/3507/3507664.svg", 
              "https://www.flaticon.com/svg/static/icons/svg/521/521789.svg",
              "https://www.flaticon.com/svg/static/icons/svg/2942/2942990.svg"]
    logos.sample
  end



end
