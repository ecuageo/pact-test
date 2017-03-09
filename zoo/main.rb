#!/usr/bin/ruby

require 'httparty'

class Alligator
  attr_reader :name

  def initialize name
    @name = name
  end

  def == other
    other.is_a?(Alligator) && other.name == name
  end
end

class AnimalServiceClient
  include HTTParty
  base_uri 'http://animal-service.com'

  def get_alligator
    name = JSON.parse(self.class.get("/alligators/100.json").body)['name']
    Alligator.new(name)
  end
end

