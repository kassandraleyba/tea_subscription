class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.title :string
      t.float :price
      t.string :status
      t.frequency :string
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
