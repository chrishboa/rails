class Bet < ActiveRecord::Base
	belongs_to :user
	belongs_to :match
  attr_accessible :match_id, :team_a_goals, :team_b_goals, :user_id

  validates :team_a_goals, :team_b_goals, presence: true

	def self.byMatch(match)
		find_by_match_id(match)
	end
end
