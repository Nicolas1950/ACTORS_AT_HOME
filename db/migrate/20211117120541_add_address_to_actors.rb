class AddAddressToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :address, :string
  end
end
