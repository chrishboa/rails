class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :match_id
      t.integer :team_a_goals
      t.integer :team_b_goals

      t.timestamps
    end
  end
end
