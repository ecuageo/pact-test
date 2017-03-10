# Ruby Pact Consumer example

[Pact documentation](https://docs.pact.io/)
[Ruby Pact](https://github.com/realestate-com-au/pact)

Better documenation [here](https://docs.pact.io/documentation/ruby.html)

## Setup

### Gemfile

* add `gem 'pact'` in your `Gemfile`

### Create a client to be mocked

* create a client that uses a mockable request

### Configure the mock service

```
# In /spec/service_providers/pact_helper.rb

require 'pact/consumer/rspec'
# or require 'pact/consumer/minitest' if you are using Minitest

Pact.service_consumer "Zoo App" do
  has_pact_with "Animal Service" do
    mock_service :animal_service do
      port 1234
    end
  end
end
```

### Write a spec

```
animal_service.given("an alligator exists").
  upon_receiving("a request for an alligator").
  with(method: :get, path: '/alligator', query: '').
  will_respond_with(
  status: 200,
  headers: {'Content-Type' => 'application/json'},
  body: {name: 'Betty'} )
```

### Run the specs

`rake test`

### Publish the resulting pacts

See [Pack Broker](https://github.com/bethesque/pact_broker)