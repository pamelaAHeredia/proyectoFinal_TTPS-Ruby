# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# localidades
l1 = Locality.create(name: 'Juana Koslay', province: :san_luis)
l2 = Locality.create(name: 'La Plata', province: :buenos_aires)
l3 = Locality.create(name: 'Agrelo', province: :mendoza)

# Sucursales
b1 = Branch.create(name: 'Sucursal Juana Koslay', address: 'jk 1234', telephone: '(123)497-0029', locality_id: l1.id)
b2 = Branch.create(name: 'Sucursal La Plata', address: 'LP 1234', telephone: '123-497-0029', locality_id: l2.id)
b3 = Branch.create(name: 'Sucursal Luján de Cuyo', address: 'LdC 1234', telephone: '1234970029', locality_id: l3.id)

# USUARIOS

u1 = User.create(username: 'admin', email: 'admin@mail.com', password: '123456')
u2 = User.create(username: 'personal', email: 'personal@mail.com', password: '123456', branch_id: b1.id)
u3 = User.create(username: 'cliente', email: 'cliente@mail.com', password: '123456')

# Asignación de roles
u1.add_role :admin
u2.add_role :bank_staff
u3.add_role :client
# permisos

# turnos

# horarios
lun1 = Schedule.create(day: :monday, start_time: '08:00', end_time: '12:30', branch_id: b1.id)
lun2 = Schedule.create(day: :monday, start_time: '08:30', end_time: '17:30', branch_id: b2.id)
lun3 = Schedule.create(day: :monday, start_time: '12:00', end_time: '16:00', branch_id: b3.id)

mar1 = Schedule.create(day: :tuesday, start_time: '08:30', end_time: '17:30', branch_id: b1.id)
mar2 = Schedule.create(day: :tuesday, start_time: '10:00', end_time: '15:00', branch_id: b2.id)
mar3 = Schedule.create(day: :tuesday, start_time: '12:00', end_time: '18:00', branch_id: b3.id)
