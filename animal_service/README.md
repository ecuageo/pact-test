# Ruby Pact Provider example

[Pact documentation](https://docs.pact.io/)
[Ruby Pact](https://github.com/realestate-com-au/pact)

## Setup

### Gemfile and Rakefile

* add `gem 'pact'` in your `Gemfile`
* add `require 'pact/tasks` in your `Rakefile`

### Creating a pact helper file

* Place the file in `[test/spec]/service_consumers/pact_helper.rb`
* specify your service and the pact you are using
* specify where to find the pact. See [Pack Broker](https://github.com/bethesque/pact_broker)
* require the provider states file

```
require 'pact/provider/rspec'
require_relative 'provider_states_for_zoo_app'

Pact.service_provider "Animal Service" do
  honours_pact_with "Zoo App" do
    pact_uri "../zoo/spec/pacts/zoo_app-animal_service.json"
  end
end
```

### Creating provider states config

Provider states allow you to alter data sources or mock upstream dependencies specific to different states needed by the pact

```
Pact.provider_states_for "Zoo App" do
  provider_state "an alligator exists" do
    set_up do
      Alligator.create(id: 100, name: "Mary")
    end
    tear_down do
      Alligator.destroy_all
      update_seq_sql = "update sqlite_sequence set seq = 0 where name = 'alligators';"
      ActiveRecord::Base.connection.execute(update_seq_sql)
    end
  end
end
```

### Verfying consumer pacts

No need to start your server, just run `rake pact:verify`. Pact files are specified in the pact helper file

### Sample passing run

```
provider_service$ rake pact:verify
SPEC_OPTS='' /Users/george.south/.rvm/rubies/ruby-2.3.2/bin/ruby -S pact verify --pact-helper /Users/george.south/test/pact-test/animal_service/test/service_consumers/pact_helper.rb
Reading pact at ../zoo/spec/pacts/zoo_app-animal_service.json

Verifying a pact between Zoo App and Animal Service
  Given an alligator exists
    a request for an alligator
      with GET /alligators/100.json
        returns a response which
          has status code 200
          has a matching body

1 interaction, 0 failures
```
