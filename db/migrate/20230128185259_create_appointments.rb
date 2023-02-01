class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.string :motive, null: false
      t.string :status, null: false
      t.string :comment

      t.references :branch, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :personnel, null: true, foreign_key: { to_table: :users }
      # son dos usuarios: el cliente, que no puede ser null, y el personal bancario, que es opcional.

      t.timestamps
    end
    # falta clave primaria sucursal + día + hora + id_user
    add_index :appointments, %i[branch_id date time], unique: true
  end
end
