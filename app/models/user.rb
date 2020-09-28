class User < ApplicationRecord
  has_many :teams, foreign_key: "owner_id"
  has_many :leagues, through: :teams

  has_many :rankings, foreign_key: "analyst_id"
  has_many :players, through: :rankings

  has_secure_password
end
