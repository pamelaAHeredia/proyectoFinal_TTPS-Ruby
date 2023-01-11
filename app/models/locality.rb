class Locality < ApplicationRecord
  validates :name, presence: true
  validates :province, presence: true

  enum :province,
       buenos_aires: 'Buenos Aires',
       catamarca: 'Catamarca',
       chaco: 'Chaco',
       chubut: 'Chubut',
       cordoba: 'Córdoba',
       corrientes: 'Corrientes',
       entre_rios: 'Entre Ríos',
       formosa: 'Formosa',
       jujuy: 'Jujuy',
       la_pampa: 'La Pampa',
       la_rioja: 'La Rioja',
       mendoza: 'Mendoza',
       misiones: 'Misiones',
       neuquen: 'Neuquén',
       rio_negro: 'Río Negro',
       salta: 'Salta',
       san_juan: 'San Juan',
       san_luis: 'San Luis',
       santa_cruz: 'Santa Cruz',
       santa_fe: 'Santa Fe',
       santiago_del_estero: 'Santiago del Estero',
       tierra_del_fuego: 'Tierra del Fuego',
       tucuman: 'Tucumán'
end
