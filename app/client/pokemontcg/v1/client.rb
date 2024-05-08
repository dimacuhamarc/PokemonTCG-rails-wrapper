# app/client/pokemontcg/v1/client.rb
require 'faraday'

module Pokemontcg
  module V1
    class Client
      BASE_URI = 'https://api.pokemontcg.io/v2/'.freeze
      API_KEY = Rails.application.credentials.poke_tcg_secret_key
      ERROR_CODES = {
        400 => 'Bad Request',
        401 => 'Unauthorized',
        403 => 'Forbidden',
        404 => 'Not Found'
      }.freeze

      def initialize
        @client = Faraday.new(url: BASE_URI) do |faraday|
          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
        end
      end

      def get_all_cards
        response = @client.get('cards', { 'X-Api-Key': API_KEY })
        handle_response(response)
      end

      def get_card_by_name(name)
        response = @client.get("cards?q=name:#{name}", { 'X-Api-Key': API_KEY })
        handle_response(response)
      end

      private

      def handle_response(response)
        JSON.parse(response.body)
      end
    end
  end
end
