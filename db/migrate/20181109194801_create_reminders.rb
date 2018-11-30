class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.text :title
      t.date :date
      t.timestamp :time
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
