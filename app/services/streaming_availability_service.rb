require 'net/http'
require 'json'

class StreamingAvailabilityService
  API_HOST = "streaming-availability.p.rapidapi.com"
  BASE_URL = "https://#{API_HOST}"

  def initialize
    @api_key = Rails.application.credentials.dig(:api, :rapidapi_key)
  end

  def search(title)
    #url = URI("#{BASE_URL}/search/title?title=#{ERB::Util.url_encode(title)}&country=us&show_type=movie&output_language=en")
    url = URI("#{BASE_URL}/shows/search/title?title=#{ERB::Util.url_encode(title)}&country=us&series_granularity=show&show_type=movie&output_language=en")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = @api_key
    request["x-rapidapi-host"] = API_HOST

    response = http.request(request)
    # binding.pry
    data = JSON.parse(response.body)

    data = JSON.parse(data) if data.is_a?(String)
    # binding.pry
    data
    
  rescue => e
    Rails.logger.error("Streaming API error: #{e.message}")
    nil
  end
end