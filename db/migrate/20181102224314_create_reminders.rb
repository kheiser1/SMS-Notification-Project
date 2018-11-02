class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :title
      t.date_field :date
      t.time_field :time
      t.text_area :notes

      t.timestamps
    end
  end
end
