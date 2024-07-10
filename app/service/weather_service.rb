require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services'

  def initialize(api_key)
    @api_key = api_key
  end

  def get_weather(city)
    url = "/timeline/#{city}"
    response = self.class.get(url, query: {
      key: @api_key,
      unitGroup: 'us',
      contentType: 'json'
    })

    if response.success?
      response.parsed_response
    else
      Rails.logger.error "Weather API request failed: #{response.code} - #{response.message}"
      Rails.logger.error "Response body: #{response.body}" if response.body.present?
      nil
    end
  end
end
