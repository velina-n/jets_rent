class AddImageToJets < ActiveRecord::Migration[7.1]
  def change
    add_column :jets, :image, :string
  end
end
