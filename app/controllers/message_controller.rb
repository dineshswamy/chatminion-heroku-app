class MessageController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:sendMessage]

	def sendMessage()
		if(!params[:from].nil? && !params[:to].nil? && !params[:message].nil?)
			from=params[:from]
			to=params[:to]
			message=params[:message]
			@query=Usercontact.select("rel_status").where("( user_id = ? AND friend_id = ? ) || ( friend_id = ? AND user_id = ? )",params[:from],params[:to],params[:to],params[:from])
			puts @query
		end

	end

end
