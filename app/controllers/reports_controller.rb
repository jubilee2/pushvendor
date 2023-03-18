class ReportsController < ApplicationController
  def index
    authorize! :read, :reports
  end
end
