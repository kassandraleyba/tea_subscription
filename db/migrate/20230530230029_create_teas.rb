class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :name
      t.text :description
      t.references :subscription, foreign_key: true

      t.timestamps
    end
  end
end
