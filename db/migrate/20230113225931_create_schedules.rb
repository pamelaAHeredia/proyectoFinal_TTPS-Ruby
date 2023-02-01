class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :day, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
    # falta clave primaria
    add_index :schedules, %i[branch_id day], unique: true
  end
end
