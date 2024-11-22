class AddImagesToJets < ActiveRecord::Migration[7.1]
  def change
    add_column :jets, :image1, :string
    add_column :jets, :image2, :string
  end
end
