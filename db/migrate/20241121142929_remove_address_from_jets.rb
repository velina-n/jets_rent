class RemoveAddressFromJets < ActiveRecord::Migration[7.1]
  def change
    remove_column :jets, :address, :string
  end
end
