class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :prid
      t.integer :cart_id
      t.integer :qu

      t.timestamps
    end
  end
end
