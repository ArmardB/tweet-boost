class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def twitter
    @twitter ||= Twitter::REST::Client.new do |config|
      # Normally you would never leave these exposed
      config.consumer_key = ENV['CONSUMER_KEY']
  		config.consumer_secret = ENV['CONSUMER_SECRET']
  		config.access_token = ENV['ACCESS_TOKEN']
  		config.access_token_secret = ENV['ACCESS_SECRET']
    end
  end 
	
end
