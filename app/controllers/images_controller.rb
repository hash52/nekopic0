class ImagesController < ApplicationController
  def index
    require 'twitter'

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = "sznhA6doIXhXzj6yEtMJcMnpA"
      config.consumer_secret      = "8v4RXZDYd3J5DyqduU3WbUh16a3cKt6Kr7qcg2DnpZ176yyLbC"
    end

    word = "サビ猫" + " exclude:retweets"
    count = 0
    @client.search(word, :result_type => "recent", :include_entities => true).each do |tweet|
    tweet.media.each do |media|
    break if count > 9
    puts media.media_url
    count += 1
  end
end
end

 helper_method :index

end
