class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :telephone, null: false

      t.timestamps
    end
    add_index :branches, :name, unique: true
  end
end
