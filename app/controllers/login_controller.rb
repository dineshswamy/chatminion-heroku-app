class LoginController < ApplicationController
	
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:register]
#psql "dbname=d86m5ohsqb9c5a host=ec2-23-23-177-33.compute-1.amazonaws.com user=ddylynfbeycyam password=pfDxgJggA3HmcepFr1aeuPkIK7 port=5432 sslmode=require"
	def register()

		begin
			 if(!params[:email_id].nil? && !params[:channel_id].nil? && !params[:name].nil?)
			 	new_user= User.new
			 	new_user.email=params[:email_id]
			 	new_user.channel_id=params[:channel_id]
			 	new_user.name=params[:name]
			 	if new_user.save
			 		@status="success"
			 		@user_id=new_user.id
			 	else
			 		@status="failure"
			 		@user_id=0
			 	end
			end
			rescue ActiveRecord::RecordNotUnique
				@status="Already registered"
		end
		render 'login/registration_status.json.erb'
	end

end