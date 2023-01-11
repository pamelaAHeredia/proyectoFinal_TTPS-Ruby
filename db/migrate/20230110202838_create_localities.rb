class CreateLocalities < ActiveRecord::Migration[7.0]
  def change
    create_table :localities do |t|
      t.string :name, null: false
      t.string :province, null: false

      t.timestamps
    end
    add_index :localities, %i[province name], unique: true
  end
end
