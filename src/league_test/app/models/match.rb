class Match < ActiveRecord::Base
	has_one :result
	has_many :bets
	belongs_to :team_a, class_name: "Team"
	belongs_to :team_b, class_name: "Team"

  attr_accessible :date, :team_a_id, :team_b_id, :week


  def hasResult?
  	!(self).result.nil?
  end

  def beddingAllowed?
  	(self).date > Time.now
  end

  	



end
