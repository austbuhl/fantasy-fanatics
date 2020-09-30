class PlayerTeam < ApplicationRecord
  belongs_to :team
  belongs_to :player

  validates :player, uniqueness: {scope: :team}
  
end
