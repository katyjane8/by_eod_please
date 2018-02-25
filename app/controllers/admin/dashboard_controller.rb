class Admin::DashboardController < Admin::BaseController
  def index
    @board = BoardService.parsed_json
  end
end
