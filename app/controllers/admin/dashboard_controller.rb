class Admin::DashboardController < Admin::BaseController
  def index
    @board = BoardService.request
  end
end
