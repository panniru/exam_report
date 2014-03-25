class CreateCces < ActiveRecord::Migration
  def change
    create_table :cces do |t|
      t.float :noofsas
      t.float :profsas
      t.float :nooffas
      t.float :proffas
      t.integer :year
      t.string :pursuingclass

      t.timestamps
    end
  end
end
