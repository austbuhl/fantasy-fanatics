class CreateOwnerLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :owner_leagues do |t|
      t.integer :league_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
