class BoardService

  # def request
  #   @conn = Faraday.new(:url => 'https://api.trello.com') do |faraday|
  #     require "pry"; binding.pry
  #     # faraday.request  :url_encoded
  #     # faraday.response :logger
  #     # faraday.adapter  Faraday.default_adapter
  #   end
  # end

  def self.parsed_json
    response = Faraday.get("https://api.trello.com/1/boards/5537d24bf8c3d773a7272f7c/cards?key=#{ENV["trello_key"]}&token=#{ENV["trello_token"]}")
    #   req.url['/boards'] = '5537d24bf8c3d773a7272f7c'
    #   req.headers['key'] = ENV["trello_key"]
    #   req.headers['token'] = ENV["trello_token"]
    # end
    resp = JSON(response.body, symbolize_headers: true)
    resp[0]
  end

  # def get_response
  #   JSON.parse(resp, symbolize_headers: true)
  # end
end
