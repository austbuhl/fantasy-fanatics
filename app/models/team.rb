class Team < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :league
  has_many :player_teams
  has_many :players, through: :player_teams
end
