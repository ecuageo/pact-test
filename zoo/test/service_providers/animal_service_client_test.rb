require 'minitest/autorun'

require_relative 'pact_helper'
require 'pact/consumer/minitest'
require_relative '../../main.rb'

class AnimalServiceClientTest < Minitest::Test
  include Pact::Consumer::Minitest

  def setup
    AnimalServiceClient.base_uri 'localhost:1234'
  end

  def test_stuff
    animal_service.given("an alligator exists").
      upon_receiving("a request for an alligator").
      with(method: :get, path: '/alligators/100.json', query: '').
      will_respond_with(
        status: 200,
        body: {name: 'Mary'})
    animal_service_client = AnimalServiceClient.new
    assert_equal animal_service_client.get_alligator, Alligator.new('Mary')
  end
end
