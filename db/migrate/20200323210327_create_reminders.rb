class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.string :email
      t.integer :hour_of_day
      t.string :phone
    end
  end
end
