class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :subject
      t.datetime :date
      t.string :location
      t.integer :total_polled

      t.timestamps null: false
    end
  end
end
