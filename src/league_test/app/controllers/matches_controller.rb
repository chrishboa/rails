class MatchesController < ApplicationController

	def show_week
		@matches = Match.find_all_by_week(params[:week])
		render action: "show"
	end

	def show_all
		@matches = Match.all
		render action: "show"
	end

end
