class RelaterController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:addRelater]

	def addRelater()
		begin
				if(!params[:user_id].nil? && !params[:relater_email].nil?)
					if User.exists?(:email=>params[:relater_email]) then 
						@new_relater = nil
						user_new_contact=Usercontact.new
						user_new_contact.user_id=params[:user_id]
						@new_relater=User.find_user_id_by_email(params[:relater_email])
						user_new_contact.relater_id=@new_relater.id
						user_new_contact.rel_status="mutual"
						if user_new_contact.save then
							@status="success"
						else
							@status="failure"
						end
					else
						@status = "user_not_registered"
					end
				end				
		rescue Exception => e
			puts e
			@status="failure by exception"
		end
		render 'relater/add_relater_status.json.erb'
		
	end
end
