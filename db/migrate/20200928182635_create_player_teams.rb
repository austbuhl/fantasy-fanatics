class CreatePlayerTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :player_teams do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps
    end
  end
end
