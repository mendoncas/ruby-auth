class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.integer :status
      t.date :date
      t.belongs_to :routine

      t.timestamps
    end
  end
end
