require 'net/http'
require 'uri'

class MessageController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => [:sendMessage]

	def sendMessage()
    puts "params"
    puts params.inspect
		if(!params[:message_id].nil? && !params[:sender_id].nil? && !params[:channel_id].nil?)
        send_notification(params[:message_id],params[:channel_id],params[:sender_id])
		end
    render 'message/sent_message_status.json.erb'
	end


 def send_notification(message_id,channel_id,sender_id)
    # client_id = '445760815141-5bjr9ht6kcdb67sh3hlrfmo82ien95ke.apps.googleusercontent.com'
    # client_secret = 'OuCDAM442cY0TzMZ_J7ta4T-'
    # refresh_token = '1/rlGkEuQO45hUm9EsPDOHrWc_DJCFmQGHAgbRW0pCyh4'
      getAccessToken()
      push_message = 
      @gcm_chrome_notification = HTTParty.post("https://www.googleapis.com/gcm_for_chrome/v1/messages",
    :body => { :channelId => channel_id,
         :subchannelId => '0',
         :payload => {
         :message_id => message_id ,
         :user_id => sender_id,
         :is_custom_message => params[:is_custom_message],
         :custom_message => params[:custom_message]
          }.to_json.html_safe
              }.to_json,
             :headers => { 'Content-Type' => 'application/json' , 'Authorization' => "Bearer #{@access_token}" })

      puts "Cloud message response #{@gcm_chrome_notification}"       
 #    payload = {
 #          :message_id => message_id ,
 #         :user_id => sender_id
 #    }.to_json
 #    channel_ids = [channel_id]                                             
 #    gcmc =  GcmForChrome.new(client_id,client_secret, refresh_token )
 #    response = gcmc.send_notification(channel_ids, '0', payload)
 #    puts "GCM message response #{response}"
  end

 def getAccessToken()
 ## Get your google access token	
 end  

 
end
end
