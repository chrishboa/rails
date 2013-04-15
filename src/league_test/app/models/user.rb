class User < ActiveRecord::Base
	has_many :bets
  attr_accessible :admin, :mail, :name, :password
end
