class AddCoordinatesToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :latitude, :float
    add_column :actors, :longitude, :float
  end
end
