class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :photo
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
