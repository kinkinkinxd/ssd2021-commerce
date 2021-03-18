class CreateCommerces < ActiveRecord::Migration[6.1]
  def change
    create_table :commerces do |t|
      t.text :title
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
