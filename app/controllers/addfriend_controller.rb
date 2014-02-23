class AddfriendController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:addRelationship]

	def addRelationship()
		begin
				if(!params[:user_id].nil? && !params[:friend_id].nil?)
					user_new_contact=Usercontact.new
					user_new_contact.user_id=params[:user_id]
					user_new_contact.friend_id=params[:friend_id]
					user_new_contact.rel_status="mutual"
					if user_new_contact.save
						@status="success"
					else
						@status="failure"
					end
				end				
		rescue Exception => e
			@status="failure"
		end
		render 'addfriend/add_friend_status.json.erb'
		
	end
end
