CLUB NAUTICO - ESTRUCTURA INDEPENDIENTE

index.html       -> menú principal
socios.html      -> formulario HTML de socios
barcos.html      -> formulario HTML de barcos
salidas.html     -> formulario HTML de salidas
patrones.html    -> formulario HTML de patrones
styles.css       -> único archivo de diseño

db.php           -> conexión PDO
socios.php       -> CRUD/API de socios
barcos.php       -> CRUD/API de barcos
salidas.php      -> CRUD/API de salidas
patrones.php     -> CRUD/API de patrones

Los formularios HTML no contienen PHP ni CSS embebido. Todos usan styles.css.
Los PHP no contienen HTML de interfaz: son la capa de acceso a MySQL y devuelven JSON.

Acciones PHP:
GET ?accion=listar
POST accion=crear
POST accion=actualizar
POST accion=eliminar

Instalación:
1. Crear la BD club_nautico con el script SQL.
2. Copiar esta carpeta a C:\xampp\htdocs\club_nautico\
3. Verificar usuario/clave en db.php.
4. Iniciar Apache y MySQL.
5. Abrir http://localhost/club_nautico/
