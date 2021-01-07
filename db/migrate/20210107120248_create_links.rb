class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.boolean :is_active

      t.timestamps
    end
  end
end
