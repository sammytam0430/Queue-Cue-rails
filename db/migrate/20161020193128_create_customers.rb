class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.integer :party

      t.timestamps
    end
  end
end
