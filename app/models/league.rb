class League < ApplicationRecord
  has_many :teams
  has_many :owners, through: :teams
end
