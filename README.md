# README
Para poder empezar a usar la aplicación es necesario cargar las seeds, de esta manera se podrá iniciar sesión como Administrador.

* Cargando las seeds: 

rake db:drop db:create db:migrate db:seed

Para iniciar sesión como ADMIN

Las credenciales del administrador son: 

* Usuario: admin
* Contraseña: 123456

Cuando se crea un usuario con rol de administrador o personal, se le asigna una contraseña por defecto: 
123456. Es posible cambiarla desde el perfil de usario. 

* creando usuarios: 

Es posible crear usuarios con los siguientes roles: Administrador, cliente y personal. 
Los usuarios creados por un administrador tendrán una contraseña por defecto (123456), que deberán cambiar una vez que inicien sesión en el sistema. 

Los usuarios con rol de cliente pueden registrarse ellos mismos en la sección "registrarse". 

# proyectoFinal_TTPS-Ruby
