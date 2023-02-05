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
u2 = User.create(username: 'personal1', email: 'personal1@mail.com', password: '123456', branch_id: b1.id)
u3 = User.create(username: 'personal2', email: 'personal2@mail.com', password: '123456', branch_id: b2.id)
u4 = User.create(username: 'personal3', email: 'personal3@mail.com', password: '123456', branch_id: b3.id)
u5 = User.create(username: 'cliente1', email: 'cliente1@mail.com', password: '123456')
u6 = User.create(username: 'cliente2', email: 'cliente2@mail.com', password: '123456')
u7 = User.create(username: 'cliente3', email: 'cliente3@mail.com', password: '123456')

# Asignación de roles

u1.add_role :admin
u2.add_role :bank_staff
u3.add_role :bank_staff
u4.add_role :bank_staff
u5.add_role :customer
u6.add_role :customer
u7.add_role :customer

# horarios
lun1 = Schedule.create(day: :monday, start_time: '08:00', end_time: '12:00', branch_id: b1.id)
lun2 = Schedule.create(day: :monday, start_time: '12:00', end_time: '16:00', branch_id: b2.id)
lun3 = Schedule.create(day: :monday, start_time: '16:00', end_time: '20:00', branch_id: b3.id)

mar1 = Schedule.create(day: :tuesday, start_time: '12:00', end_time: '16:00', branch_id: b1.id)
mar2 = Schedule.create(day: :tuesday, start_time: '16:00', end_time: '20:00', branch_id: b2.id)
mar3 = Schedule.create(day: :tuesday, start_time: '08:00', end_time: '12:00', branch_id: b3.id)

mier1 = Schedule.create(day: :wednesday, start_time: '08:00', end_time: '12:00', branch_id: b1.id)
mier2 = Schedule.create(day: :wednesday, start_time: '12:00', end_time: '16:00', branch_id: b2.id)
mier3 = Schedule.create(day: :wednesday, start_time: '16:00', end_time: '20:00', branch_id: b3.id)

jue1 = Schedule.create(day: :thursday, start_time: '16:00', end_time: '20:00', branch_id: b1.id)
jue2 = Schedule.create(day: :thursday, start_time: '08:00', end_time: '12:00', branch_id: b2.id)
jue3 = Schedule.create(day: :thursday, start_time: '12:00', end_time: '16:00', branch_id: b3.id)

vie1 = Schedule.create(day: :friday, start_time: '12:00', end_time: '16:00', branch_id: b1.id)
vie2 = Schedule.create(day: :friday, start_time: '16:00', end_time: '20:00', branch_id: b2.id)
vie3 = Schedule.create(day: :friday, start_time: '08:00', end_time: '12:00', branch_id: b3.id)

sab1 = Schedule.create(day: :saturday, start_time: '08:00', end_time: '12:00', branch_id: b1.id)
sab2 = Schedule.create(day: :saturday, start_time: '12:00', end_time: '16:00', branch_id: b2.id)
sab3 = Schedule.create(day: :saturday, start_time: '16:00', end_time: '20:00', branch_id: b3.id)

dom1 = Schedule.create(day: :sunday, start_time: '16:00', end_time: '20:00', branch_id: b1.id)
dom2 = Schedule.create(day: :sunday, start_time: '08:00', end_time: '12:00', branch_id: b2.id)
dom3 = Schedule.create(day: :sunday, start_time: '12:00', end_time: '16:00', branch_id: b3.id)

# Turnos

# turnos pendientes cliente1
Appointment.create(date: '2023-02-15', time: '10:00', motive: 'Operaciones de cajas', status: 'pending', user_id: u5.id, branch_id: b1.id)
Appointment.create(date: '2023-02-15', time: '13:00', motive: 'Gestión Comercial', status: 'pending', user_id: u5.id, branch_id: b2.id)
Appointment.create(date: '2023-02-15', time: '17:00', motive: 'Consultas', status: 'pending', user_id: u5.id, branch_id: b3.id)
# turnos pendientes cliente2
Appointment.create(date: '2023-02-17', time: '9:30', motive: 'Operaciones de cajas', status: 'pending', user_id: u6.id, branch_id: b1.id)
Appointment.create(date: '2023-02-17', time: '14:30', motive: 'Gestión comercial', status: 'pending', user_id: u6.id, branch_id: b2.id)
Appointment.create(date: '2023-02-17', time: '11:30', motive: 'Consultas', status: 'pending', user_id: u6.id, branch_id: b3.id)
# Turnos pendientes cliente3
Appointment.create(date: '2023-02-20', time: '10:15', motive: 'Operaciones de cajas', status: 'pending', user_id: u7.id, branch_id: b1.id)
Appointment.create(date: '2023-02-20', time: '13:15', motive: 'Gestión Comercial', status: 'pending', user_id: u7.id, branch_id: b2.id)
Appointment.create(date: '2023-02-20', time: '18:15', motive: 'Consultas', status: 'pending', user_id: u7.id, branch_id: b3.id)