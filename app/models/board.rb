class Board
  attr_reader :id, :name, :dateLastActivity, :badges

  def initialize(attrs = {})
    @id = attrs["id"]
    @name = attrs["name"]
    @dateLastActivity = attrs["dateLastActivity"]
    @badges = attrs["badges"]
  end
end
