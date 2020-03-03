class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.time :time_of_day
      t.date :first_day
      t.integer :checkin_count, { :default => 0 }
      t.boolean :checkin_today, { :default => false }
      t.integer :owner_id

      t.timestamps
    end
  end
end
