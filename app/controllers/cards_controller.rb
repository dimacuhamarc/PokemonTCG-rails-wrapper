class CardsController < ApplicationController
  def index
    @cards = client.get_all_cards['data']
  end

  def show
    # get_card_by_name is returning many cards with the same name so I'm just getting the first one
    cards = client.get_card_by_name(params[:id])
    @all_cards = cards['data']
    @all_cards = cards['data'].reject { |card| card['rarity'].nil? }
    @all_cards.sort_by! { |card| card['rarity'] }
  end

  private

  def client
    @client ||= Pokemontcg::V1::Client.new
  end
end
