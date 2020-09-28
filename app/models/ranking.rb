class Ranking < ApplicationRecord
  belongs_to :analyst, class_name: "User"
  belongs_to :player

end
