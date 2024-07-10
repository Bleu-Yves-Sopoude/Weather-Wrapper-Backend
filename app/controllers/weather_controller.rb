# app/controllers/weather_controller.rb
class WeatherController < ApplicationController
    def show
      city = params[:city]
      weather_service = WeatherService.new(ENV['VISUAL_CROSSING_API_KEY'])
      weather_data = weather_service.get_weather(city)

      if weather_data
        render json: weather_data
      else
        render json: { error: 'Failed to fetch weather data' }, status: :unprocessable_entity
      end
    end
  end

