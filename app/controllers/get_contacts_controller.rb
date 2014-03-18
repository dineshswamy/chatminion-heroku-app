class GetContactsController < ApplicationController

	def get_contacts()
		@user_contacts=Usercontact.select("relater_id").where(" user_id = ?",params[:id])	
		available=[]
		@user_contacts.each do |variable|
			available<<variable.relater_id
		end
		@users=User.select("id,channel_id,name").where("id IN (?) ",available)
		render "get_contacts/all_contacts.json.erb"
	end
end

