# SQLEditor export: Rails Migration
# id columns are removed
class TestExport < ActiveRecord::Migration 
  def change
    create_table :_result do |t|
      t.references :_match
      t.integer :team_a_goals
      t.integer :team_b_goals
    end

    create_table :_team do |t|
      t.string :name
    end

    create_table :_week do |t|
      t.integer :week_nr
    end

    create_table :_match do |t|
      t.datetime :Datum
      t.references :_week
      t.references :_team
      t.references :_team
    end

  end

end
