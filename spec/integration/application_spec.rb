require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /albums" do
    it "returns the list of albums as json" do
      response = get("/albums")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq(AlbumRepository.new.all.to_json)
    end
  end
end
