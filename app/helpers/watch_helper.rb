module WatchHelper
  private

  def normalize_results(raw)
    raw.map do |item|
      OpenStruct.new(
        title: item["title"],
        year: item["releaseYear"],
        overview: item["overview"],
        streaming_services: extract_services(item)
      )
      end
  end

  def extract_services(result)
  # If streamingInfo exists, convert keys to readable sources
  return [] unless item["streamingInfo"].is_a?(Hash)

  item["streamingInfo"].keys
  end

end
