require 'net/http'
require 'uri'
require 'json'

class PagesController < ApplicationController
  def home
    nyc_vaccine_locations_url = 'https://data.cityofnewyork.us/resource/inaf-e6a5.json'
    uri = URI.parse(nyc_vaccine_locations_url)
    response = Net::HTTP.get_response(uri)

    @json_objects = JSON.parse(response.body).first(10)
  end
end
