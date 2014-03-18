require 'net/http'
require 'uri'

class MessageController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:sendMessage]

	def sendMessage()
		if(!params[:message].nil? && !params[:sender].nil? && !params[:channel_id].nil?)
        send_notification(params[:message],params[:channel_id])
		end
    render 'message/sent_message_status.json.erb'
	end


 def send_notification(message,channel_id)
      @urlstring_to_post="https://accounts.google.com/o/oauth2/token"
      @result = HTTParty.post(@urlstring_to_post.to_str, 
                      :body => { :client_id => '1042427713767-vdrr903a3fpgaibpu0chjrmpksog55dt.apps.googleusercontent.com', 
         :client_secret => 'o62Vexbm28jng33ngMgSG29i', 
         :refresh_token => '1/R68zcIXLz-xAjnHpj6KmZFuMjjCXmHIPQpQz_-EW8To',
         :grant_type => 'refresh_token'
                              },
                              :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' } )

      puts "Response #{@result}"
      @json_response=JSON.parse(@result.body)
      @access_token=@json_response["access_token"]
      @gcm_chrome_notification = HTTParty.post("https://www.googleapis.com/gcm_for_chrome/v1/messages",
    :body => { :channelId => "14946481999516238350/blfcfieoonpmhmdnohgijojmliegelne",
         :subchannelId => '0',
         :payload => message

                                               }.to_json,
             :headers => { 'Content-Type' => 'application/json' , 'Authorization' => "Bearer #{@access_token}" }  )

      puts "Cloud message response #{@gcm_chrome_notification}"                                                    
 end

 def build_message()
  
 end
 
end
