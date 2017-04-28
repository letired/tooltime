class AddCityToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :city, :string
  end
end
