class WatchController < ApplicationController
  def search
    if params[:title].present?
      service = StreamingAvailabilityService.new
      @results = service.search(params[:title])
    end
  end
end
