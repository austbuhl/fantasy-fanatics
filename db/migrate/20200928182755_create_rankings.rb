class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.integer :analyst_id
      t.integer :player_id
      t.integer :ranking

      t.timestamps
    end
  end
end
