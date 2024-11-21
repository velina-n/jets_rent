class AddAirportToJets < ActiveRecord::Migration[7.1]
  def change
    add_column :jets, :airport, :string
  end
end
