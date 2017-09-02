require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:first_floof) { Floof.create( name: "Dog", floofiness: 5) }

  describe "POST#create" do
    it "creates a new Post for a floof" do
      post_json = { body: "This is a dog", floof_id: first_floof.id }.to_json

      expect{ post(:create, post_json)}.to change{ Post.count }.by 1
    end

    it "returns the json of the newly posted post" do
      post_json = { body: "This is a dog", floof_id: first_floof.id }.to_json

      post(:create, post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["body"]).to eq "This is a dog"
      expect(returned_json["floof_id"]).to eq first_floof.id
    end
  end
end
