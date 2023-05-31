class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :status
      t.float :price
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
