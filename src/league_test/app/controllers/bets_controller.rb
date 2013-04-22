# mb {
# 	:match
# 	:team_a_goals
# 	:team_b_goals
# 	:bet_a
# 	:bet_b
# }
class BetsController < ApplicationController
before_filter :require_login
	def index

		#user = User.find(session[:user_id])
		matches = Match.all

		match_bet_a = Array.new
		_matches = Array.new
		_bets = Array.new
		matches.each do |match|
			mb = {}
			mb[:match] = match
			mb[:result] = Result.byMatch(match)				
			mb[:bet] = current_user.bets.byMatch(match)

			match_bet_a << mb
			_matches << mb[:match]
			_bets << mb[:bet]
		end
		@match_bet_a = match_bet_a
		@user = current_user
		@matches = _matches
		@bets = _bets

		#logger.debug "New bets: #{@bets[1].attributes.inspect}"
	end

	def new
		@bet = Bet.new
	end

	def update
		@bet = current_user.bets.byMatch(params[:bet][:match_id])
		unless @bet.nil?
			if @bet.match.beddingAllowed?
			
				 @bet.update_attributes(params[:bet])
				 @bet.save
			end
		end
		redirect_to bets_path
	end


	def create
		if Match.find(params[:bet][:match_id]).beddingAllowed?	
		@bet = Bet.create(params[:bet])	
			#@bet = Bet.create(user_id: current_user.id, team_a_goals: params[:bet][:team_a_goals],
			#		 team_b_goals: params[:bet][:team_b_goals], match_id: params[:bet][:match_id])
		end
		redirect_to bets_path
	end


end
