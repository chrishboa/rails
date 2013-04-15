class Bet < ActiveRecord::Base
	belongs_to :user
	belongs_to :match
  attr_accessible :match_id, :team_a_goals, :team_b_goals, :user_id
end
