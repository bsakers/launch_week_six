require "rails_helper"

RSpec.describe Api::V1::FloofsController, type: :controller do
  let(:first_floof) { Floof.create(name: "Dog", floofiness: 5) }
  let!(:post1) { Post.create(body: "This is a dog", floof_id: first_floof.id) }

  describe "GET#show" do
    it "should return a floof" do

      get :show, id: first_floof.id
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json['floof']["name"]).to eq "Dog"
      expect(returned_json['floof']["floofiness"]).to eq 5
      expect(returned_json['posts'][0]["body"]).to eq "This is a dog"
    end
  end
end
