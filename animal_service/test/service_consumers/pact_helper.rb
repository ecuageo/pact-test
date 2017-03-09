require 'pact/provider/rspec'
require_relative 'provider_states_for_zoo_app'

Pact.service_provider "Animal Service" do
  honours_pact_with "Zoo App" do
    pact_uri "../zoo/spec/pacts/zoo_app-animal_service.json"
  end
end
