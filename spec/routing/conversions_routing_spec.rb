require "rails_helper"

RSpec.describe ConversionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/conversions").to route_to("conversions#index")
    end

    it "routes to #new" do
      expect(get: "/conversions/new").to route_to("conversions#new")
    end

    it "routes to #show" do
      expect(get: "/conversions/1").to route_to("conversions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/conversions/1/edit").to route_to("conversions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/conversions").to route_to("conversions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/conversions/1").to route_to("conversions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/conversions/1").to route_to("conversions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/conversions/1").to route_to("conversions#destroy", id: "1")
    end
  end
end
