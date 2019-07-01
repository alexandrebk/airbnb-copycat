class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.integer :surface
      t.integer :price
      t.integer :room
      t.text :description
      t.integer :max_guests

      t.timestamps
    end
  end
end
