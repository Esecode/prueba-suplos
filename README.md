# Sistema de Gestión de Ofertas

Este proyecto es un sistema de gestión de ofertas que permite realizar operaciones CRUD (Crear, Copiar y Consultar) en una tabla llamada "oferta" en una base de datos.

## Requisitos

- Servidor web (por ejemplo, Apache)
- PHP (versión 8.0.25)
- MySQL (u otro sistema de gestión de bases de datos compatible)

## Configuración

1. Clona este repositorio en tu servidor local.
2. Crea una base de datos llamada "ofertas" en tu sistema de gestión de bases de datos.
3. Importa el archivo SQL proporcionado (`ofertas.sql`) en la base de datos recién creada para crear la tabla y poblarla con algunos datos de ejemplo.
4. Abre el archivo `config.php` y actualiza los valores de conexión a la base de datos (`$servidor`, `$user`, `$password`, `$db`) según la configuración de tu entorno.

## Uso

El sistema de gestión de ofertas proporciona una interfaz web donde se pueden realizar las siguientes operaciones:

- **Consultar ofertas**: Accede a la página principal del sistema para ver todas las ofertas disponibles. Haz clic en una oferta para ver más detalles.
- **Agregar oferta**: Desde la página principal, haz clic en el botón "Agregar oferta" para crear una nueva oferta. Completa el formulario con la información requerida y haz clic en "Guardar".
- **Editar oferta**: Desde la página de detalles de una oferta, haz clic en el botón "Editar" para modificar la información de la oferta. Completa el formulario con los nuevos valores y haz clic en "Guardar".
- **Eliminar oferta**: Desde la página de detalles de una oferta, haz clic en el botón "Eliminar" para eliminar la oferta de la base de datos.

## API

El sistema de gestión de ofertas también proporciona una API para realizar operaciones CRUD a través de solicitudes HTTP. Aquí hay algunos ejemplos de cómo interactuar con la API:

- **Consultar ofertas**: `GET http://localhost/ofertas/`
- **Consultar una oferta específica**: `GET http://localhost/ofertas/?consultar=ID_OFERTA`
- **Agregar una nueva oferta**: `POST http://localhost/ofertas/?insertar=1` con los datos de la oferta en formato JSON en el cuerpo de la solicitud.
- **Actualizar una oferta existente**: `POST http://localhost/ofertas/?actualizar=ID_OFERTA` con los datos actualizados de la oferta en formato JSON en el cuerpo de la solicitud.
- **Eliminar una oferta**: `GET http://localhost/ofertas/?borrar=ID_OFERTA`

Ten en cuenta que debes reemplazar `localhost` con la dirección de tu servidor local y `ID_OFERTA` con el ID de la oferta correspondiente.



