class CreateAlligators < ActiveRecord::Migration[5.0]
  def change
    create_table :alligators do |t|
      t.string :name

      t.timestamps
    end
  end
end
