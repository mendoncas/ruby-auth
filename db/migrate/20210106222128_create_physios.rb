class CreatePhysios < ActiveRecord::Migration[6.1]
  def change
    create_table :physios do |t|
      t.string :crefito
      t.belongs_to :user

      t.timestamps
    end
  end
end
