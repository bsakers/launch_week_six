require 'spec_helper'
require 'rails_helper'

RSpec.describe Api::V1::CerealsController, type: :controller do
  let!(:first_cereal) { Cereal.create(name: "Rick", description: "Rick and Morty is based on Doc and Morty") }
  let!(:second_cereal) { Cereal.create(name: "Morty", description: "Rick and Morty cereal would be out of this world") }

  describe "GET#index" do
    it "should return a list of all the cereals" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json).to be_kind_of(Array)

      expect(returned_json[0]["name"]).to eq "Rick"
      expect(returned_json[0]["description"]).to eq "Rick and Morty is based on Doc and Morty"

      expect(returned_json[1]["name"]).to eq "Morty"
      expect(returned_json[1]["description"]).to eq "Rick and Morty cereal would be out of this world"
    end
  end

  describe "GET#show" do
    it "should return a single cereal" do

      get :show, id: first_cereal.id
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 5
      expect(returned_json).to be_kind_of(Hash)

      expect(returned_json["name"]).to eq "Rick"
      expect(returned_json['description']).to eq "Rick and Morty is based on Doc and Morty"
    end
  end
end
