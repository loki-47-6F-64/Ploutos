class OverviewsController < ApplicationController
before_action :authenticate, only: [:index]
  include Finance

  def index
    @status = Status.new @current_user
  end
end
