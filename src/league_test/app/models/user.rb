class User < ActiveRecord::Base
	has_many :bets
	has_secure_password
	validates :mail,
	format: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
	uniqueness: true

  attr_accessible :admin, :mail, :name, :password
end
