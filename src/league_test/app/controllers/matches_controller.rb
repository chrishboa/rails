class MatchesController < ApplicationController
before_filter :require_login
	def show_week
		@matches = Match.find_all_by_week(params[:week])
		render action: "show"
	end

	def show_all

		mr = {}
		@matches = Match.all

		@matches.each do |match|

		end
		render action: "show"
	end

end
