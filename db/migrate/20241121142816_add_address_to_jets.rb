class AddAddressToJets < ActiveRecord::Migration[7.1]
  def change
    add_column :jets, :address, :string
  end
end
