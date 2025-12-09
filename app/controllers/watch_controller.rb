class WatchController < ApplicationController
  def search
    if params[:title].present?
      service = StreamingAvailabilityService.new
      @results = service.search(params[:title])
    end
    # binding.pry
    render partial: "movies/watch_results", locals: { results: @results }
  end
end
