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
