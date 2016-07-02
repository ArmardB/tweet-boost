class TwitterAPI


  def self.my_tweets
    client.user_timeline('armardrb', exclude_replies: true, include_rts: false)
  end

  def self.search(search)
  	#client.search("#{search}", result_type: "recent", exclude_replies: true, include_rts: false)
  end
  
  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
  		config.consumer_secret = ENV['CONSUMER_SECRET']
  		config.access_token = ENV['ACCESS_TOKEN']
  		config.access_token_secret = ENV['ACCESS_SECRET']
    end
  end
end