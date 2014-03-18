class User < ActiveRecord::Base

	def self.find_user_id_by_email(user_email)
			user=User.select("id,channel_id,name").find_by(:email=>user_email)
		return user
	end

end
