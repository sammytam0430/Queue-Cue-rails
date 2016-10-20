class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.integer :party
      t.boolean :add_to_list

      t.timestamps
    end
  end
end
