class AddNotificationsToUsers < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :user
      t.timestamps
      t.text :notification_type
      t.text :description
      t.datetime :duration
      t.boolean :status, :default => true
    end
  end
end
