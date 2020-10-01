class AddPhotoUrlToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :photo_url, :string 
  end
end
