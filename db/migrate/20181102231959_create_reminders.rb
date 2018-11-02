class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :notes

      t.timestamps
    end
  end
end
