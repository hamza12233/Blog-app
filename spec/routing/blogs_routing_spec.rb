require "rails helper"

RSpec.describe BlogsController, type: :routing do
  describe "routing" do
    it "route to #index" do
      expect(get: "/blogs").to route_to("blogs#index")
    end

    it "route to #create" do
      expect(post: "/blogs").to route_to("blogs#create")
    end

    it "route to #update" do
      expect(put: "/blogs/1").to route_to("blogs#update", id: "1")
    end

    it "route to #show" do
      expect(get: "/blogs/1").to route_to("blogs#show", id: "1")
    end

    it "route to #destroy" do
      expect(delete: "/blogs/1").to route_to("blogs#destroy", id: "1")
    end
  end
end