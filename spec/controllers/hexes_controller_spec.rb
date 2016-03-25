require 'rails_helper'

RSpec.describe HexesController, type: :controller do

  describe "GET a hex" do
    it "fetches a hex for a given map" do
      map = Map.create
      country = Country.create(map_id: map.id, name: "Test Country")
      province = Province.create(country_id: country.id, map_id: map.id, name: "test province")
      hex = Hex.create(name: "test hex", description: "test hex", map_id: map.id, country_id: country.id, province_id: province.id, x: 1, y: 1, created_at: "2016-03-25T04:04:59.000Z", updated_at: "2016-03-25T04:04:59.000Z")
      get :show, map_id: map.id, x: hex.x, y: hex.y
      expect(response.body).to eq(hex.to_json)
    end
  end

  describe "POST a hex" do
    it "fetches a hex for a given map" do
      map = Map.create
      country = Country.create(map_id: map.id, name: "Test Country")
      province = Province.create(country_id: country.id, map_id: map.id, name: "test province")
      hex_data = {map_id: map.id, x: 1, y: 1, name: "test hex"}
      post :create, {format: 'json', map_id: map.id, x: 1, y: 1, hex: hex_data}
      return_value = JSON.parse(response.body)
      expect(return_value["map_id"]).to eq(hex_data[:map_id])
      expect(return_value["x"]).to eq(hex_data[:x])
      expect(return_value["y"]).to eq(hex_data[:y])
      expect(return_value["name"]).to eq(hex_data[:name])
    end
  end

end
