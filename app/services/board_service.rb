class BoardService

  def self.request
    @conn = Faraday.new(:url => "https://api.trello.com") do |faraday|
      faraday.headers['key'] = ENV["trello_key"]
      faraday.headers['token'] = ENV["trello_token"]
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/1/boards/5537d24bf8c3d773a7272f7c/cards?")
    resp = JSON.parse(response.body, symbolize_headers: true)
    resp.map do |result|
      Board.new(result)
    end
  end
end
