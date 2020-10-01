class Team < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :league
  has_many :player_teams
  has_many :players, through: :player_teams

  # accepts_nested_attributes_for :players

  def players_attributes=(players_attributes)
    players_attributes.values.each do |player_attribute|
        player = Player.find_by(player_attribute)

        unless self.players.include?(player)
          self.players << player
        end
    end
  end



  def qb1
    self.players.where(position: "QB").sort_by {|player| player.avg_ranking}.first
  end

  def rb1
    self.players.where(position: "RB").sort_by {|player| player.avg_ranking}.first
  end

  def rb2
    self.players.where(position: "RB").sort_by {|player| player.avg_ranking}.second
  end

  def wr1
    self.players.where(position: "WR").sort_by {|player| player.avg_ranking}.first
  end

  def wr2
    self.players.where(position: "WR").sort_by {|player| player.avg_ranking}.second
  end

  def te1
    self.players.where(position: "TE").sort_by {|player| player.avg_ranking}.first
  end

  def flex
    self.players.where(position: ["RB", "WR", "TE"]).sort_by {|player| player.avg_ranking}[5]
  end

  def kicker
    self.players.where(position: "K").sort_by {|player| player.avg_ranking}.first
  end

  def defense
    self.players.where(position: "D").sort_by {|player| player.avg_ranking}.first
  end

  def starters
    starters = [self.qb1, self.rb1,self.rb2, self.wr1,self.wr2,self.te1,self.flex,self.defense, self.kicker]
  end

  # def bench
  #   bench = self.players.where.not(self.starters)
  #   # bench =[]
  #   # self.players.each do |player|
  #   #   if !player.in?(self.starters)
  #   #     bench << player
  #   #   end
  #   # end
  #   # bench
  # end

end
