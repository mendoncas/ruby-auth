class CreateRoutines < ActiveRecord::Migration[6.1]
  def change
    create_table :routines do |t|
      t.date :beginning
      t.date :end
      t.belongs_to :link
      
      t.timestamps
    end
  end
end
