require 'net/http'
require 'uri'

class MessageController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :protect_from_forgery,:except => []
end
