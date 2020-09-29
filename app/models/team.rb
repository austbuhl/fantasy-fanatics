class Team < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :league
  has_many :player_teams
  has_many :players, through: :player_teams

  # accepts_nested_attributes_for :players

  def players_attributes=(players_attributes)
    players_attributes.values.each do |player_attribute|
        player = Player.find_by(player_attribute)
        self.players << player
    end
  end

end
