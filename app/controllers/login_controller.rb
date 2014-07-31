class LoginController < ApplicationController
	
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:register]
	def register()
	end

end
