# frozen_string_literal: true

class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false

      t.timestamps
    end
    add_index :subscribers, :email, unique: true
  end
end
