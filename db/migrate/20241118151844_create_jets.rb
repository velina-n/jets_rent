class CreateJets < ActiveRecord::Migration[7.1]
  def change
    create_table :jets do |t|
      t.string :model
      t.integer :price
      t.boolean :available
      t.references :user, null: false, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
