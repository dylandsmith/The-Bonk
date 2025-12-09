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

    # response = http.request(request)
    # data = JSON.parse(response.body)
    # data = JSON.parse(data) if data.is_a?(String)
    
    response = http.request(request)
    raw = JSON.parse(response.body)
    # Rails.logger.info(">>> RAW BEFORE NORMALIZE: #{raw.inspect}")
    # normalized = normalize_results(raw)
    # Rails.logger.info(">>> NORMALIZED: #{normalized.inspect}")
    # normalized

    results = normalize_results(raw)
    # binding.pry
    # results = raw["result"] || []

    # # Normalize results into OpenStructs that your partial can use
    # results.map do |r|
    #   OpenStruct.new(
    #     title: r["title"],
    #     overview: r["overview"],
    #     year: r["releaseYear"],
    #     streaming_services: extract_services(r)
    #   )
    # end
    # binding.pry
    # data
    results
    
  rescue => e
    Rails.logger.error("Streaming API error: #{e.message}")
    nil
  end

  private

  def normalize_results(raw)
    return [] unless raw.is_a?(Array) && raw.any?

    item = raw.first  # ← Only the first result

    [
      OpenStruct.new(
        title: item["title"],
        year: item["releaseYear"],
        overview: item["overview"],
        streaming_services: extract_services(item["streamingOptions"])
      )
    ]
    # binding.pry
  end

  def extract_services(info)
    return [] unless info

    # info is the hash: { "us" => [ { ... }, { ... } ] }
    us_info = info["us"]
    return [] unless us_info.is_a?(Array)

    us_info.map do |entry|
      {
        service_id: entry.dig("service", "id"),
        service_name: entry.dig("service", "name"),
        link: entry["link"],
        type: entry["type"],
        price: entry.dig("price", "formatted")
      }
    end
  end

end