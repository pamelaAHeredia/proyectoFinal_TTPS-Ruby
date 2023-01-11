# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# USUARIOS

u1 = User.create(username: 'admin', email: 'admin@mail.com', password: '123456')
u2 = User.create(username: 'personal', email: 'personal@mail.com', password: '123456')
u3 = User.create(username: 'cliente', email: 'cliente@mail.com', password: '123456')

# Asignación de roles
u1.add_role :admin
u2.add_role :bank_stuff
u3.add_role :client

# Sucursales

# localidades

# permisos

# turnos

# horarios
