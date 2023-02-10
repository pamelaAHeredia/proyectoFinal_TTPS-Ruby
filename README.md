<h1 align="center"> Trabajo práctico final integrador </h1>
<h3 align="center"> TTPS -Opción Ruby  </h3>


#Índice

*[Descripción del proyecto](#descripción-del-proyecto)

*[Acceso al proyecto](#acceso-al-proyecto)

*[Funcionalidades](#funcionalidades)

*[Decisiones tomadas](#decisiones-tomadas)

## Descripción del proyecto

- `Sistema de gestión de turnos para un banco`. 
Brinda la posibilidad de gestionar las sucursales, los horarios de atención, los usuarios y los turnos.

## Acceso al proyecto

- `1`: Git clone Para clonar el repositorio.
- `2`: bundle install , para instalar las dependencias.
- `3`: rails db:create db:migrate db:seed , para crear la base de datos, generar las migraciones y generar los datos necesarios para poder probar el sistema. 
- `4`: rails serve o rails s , para iniciar el servidor.

- `Credenciales para iniciar sesión` : 
    * Para iniciar sesión como administrador: 
        - Usuario: admin
        - Contraseña: 123456
    * Para iniciar sesión como personal: 
        - Usuario: personal1
        - Contraseña: 123456

    * Para iniciar sesión como cliente: 
        - Usuario: cliente1
        - Contraseña: 123456

## Funcionalidades

- `Gestión de Usuarios`
    - Creación de usuarios: 
        - Todos usuarios pueden ser creados por un usuario con rol de administrador, éstos tendrán una contraseña por defecto '123456', que puede ser cambiada una vez que inicien sesión en el sistema. 
        - Los usuarios con rol de cliente pueden registrarse ellos mismos desde la sección 'registrarse'.
    - Eliminación de usuarios: 
        - Los usuarios sólo pueden ser eliminados por un administrador.
        - Un usuario con rol de administrador no puede eliminar su propia cuenta.
    - Edición de usuarios: 
        - Los usuarios con rol de cliente pueden editar su propia información. 
        - Los usuarios con rol de personal no pueden editar su información. 
        - Los usuarios con rol de administrador pueden editar las información de todos los usuarios, incluyendo la suya propia.

- `Gestión de Sucursales`: 
    - Las sucursales son creadas, modificadas y eliminadas por un usuario con rol de administrador. 
    - Se puede visualizar la información sobre las mismas junto con sus horarios de atención.

- `Gestión de turnos`: 
    - Los clientes pueden solicitar turnos, una vez registrados en el sistema.
    - Los turnos sólo pueden ser editados o cancelados por el usuario que los creó.

- `Gestión de horarios`: 
    - Los horarios sólo pueden ser creados, modificados y eliminados por un usuario con rol de administrador. 
    - Pueden ser visualizados junto a la información de la sucursal correspondiente. 

## Decisiones tomadas 

- El administrador por defecto es el que tiene id 1, y este usuario no se puede eliminar o modificar desde la interfaz de usuario.

- Para cancelar los turnos decidí hacer una borrado físico. 

- Los turnos pueden ser filtrados por estado. 
 
- Los usuarios con rol de cliente pueden ver las sucursales con sus horarios. Pensé que, de momento, simplificaría un poco la tarea de sacar un turno. 

- Si una sucursal no tiene personal asociado ni horarios definidos, no será mostrada en la lista de sucursales disponibles para sacar turno. 



