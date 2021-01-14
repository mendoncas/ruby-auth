class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.integer :status
      t.date :date
      t.belongs_to :routine
      t.references :routine, foreign_key: { to_table: :routine }

      t.timestamps
    end
  end
end
