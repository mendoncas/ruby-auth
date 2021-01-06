class CreateDefaults < ActiveRecord::Migration[6.1]
  def change
    create_table :defaults do |t|
      t.string :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
