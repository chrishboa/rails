class Result < ActiveRecord::Base
	belongs_to :match
  attr_accessible :match_id, :team_a_goals, :team_b_goals

  def self.byMatch(match)
  	find_by_match_id(match)
  end
end
