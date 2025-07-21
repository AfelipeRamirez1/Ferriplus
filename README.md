
# Proyecto Ferriplus

Este es un sistema de gestión para una ferretería, diseñado para manejar diversas operaciones como productos, ventas, empleados, clientes, proveedores y envíos. El proyecto pone un fuerte énfasis en la **integridad y lógica de la base de datos**, utilizando características avanzadas como **vistas, triggers y roles/usuarios** para asegurar la consistencia de los datos y la gestión de permisos.

---

## 🚀 Tecnologías Utilizadas

* **Lenguaje de Programación:** Java
* **Sistema de Construcción:** Apache Ant
* **Base de Datos:** MySQL
* **Conector JDBC:** MySQL Connector/J

---

## 🛠️ Configuración de la Base de Datos

Este proyecto se conecta a una base de datos **MySQL** llamada `Ferriplus`.

1.  **Asegúrate de tener un servidor MySQL funcionando** en `localhost` (o ajusta la variable `host` en `Conexion.java` si tu servidor está en otra dirección).

2.  **Ejecuta los scripts SQL** ubicados en la carpeta `db/` **en el siguiente orden exacto** para configurar la base de datos:

    ```bash
    # Ejemplo usando el cliente de línea de comandos de MySQL
    # (Asegúrate de estar logueado en MySQL con un usuario con privilegios, ej. root)

    SOURCE /ruta/absoluta/a/ProyectoFerriplus/db/01_Ferriplus_Crear.sql;
    SOURCE /ruta/absoluta/a/ProyectoFerriplus/db/02_Indices_pro.sql;
    SOURCE /ruta/absoluta/a/ProyectoFerriplus/db/03_Usuarios_vistas_permisos.sql;
    SOURCE /ruta/absoluta/a/ProyectoFerriplus/db/04_Procedimientos.sql;
    SOURCE /ruta/absoluta/a/ProyectoFerriplus/db/05_Triggers_pro.sql;
    ```
    * **Usuarios de prueba configurados:**
        * **Administrador:**
            * Usuario: `administrador` / Contraseña: `administrador`
            * Usuario: `Tania` / Contraseña: `administrador`
        * **Empleado:**
            * Usuario: `empleado` / Contraseña: `regular`
            * Usuario: `Jose` / Contraseña: `empleado`
            * Usuario: `Luis` / Contraseña: `empleado`
        * **Cliente:**
            * Usuario: `Fredy` / Contraseña: (vacía)
            * Usuario: `Andres` / Contraseña: (vacía)

---

## 📦 Dependencias

El proyecto requiere el **MySQL Connector/J**.

1.  **Descargar el Driver:** Obtén la versión más reciente desde la página oficial de MySQL Connector/J. Asegúrate de seleccionar "Platform Independent" (el archivo ZIP o TAR.GZ).
    [https://dev.mysql.com/downloads/connector/j/](https://dev.mysql.com/downloads/connector/j/)
2.  **Copiar el JAR:** Una vez descargado y descomprimido (si aplica), copia el archivo `mysql-connector-j-X.Y.Z.jar` a la carpeta `ProyectoFerriplus/libraries/`.
3.  **Añadir al Classpath en NetBeans:**
    * En NetBeans, haz clic derecho en el nombre de tu proyecto (`ProyectoFerriplus`).
    * Selecciona `Properties` (Propiedades).
    * Ve a la categoría `Libraries` (Librerías).
    * En la pestaña `Compile`, haz clic en `Add JAR/Folder...` y selecciona el `mysql-connector-j-X.Y.Z.jar` desde `libraries/`.
    * Asegúrate de eliminar cualquier JARs antiguos o incorrectos (como `ojdbc17.jar`) de esta lista.

---

## ▶️ Cómo Compilar y Ejecutar

Este proyecto utiliza **Apache Ant** para su construcción.

1.  **Instala Apache Ant:** Si no lo tienes, instálalo en tu sistema operativo (ej. `sudo pacman -S ant` en Manjaro, o descarga desde la página de Ant para otras plataformas).

2.  **Compila el proyecto:**
    Abre una terminal en la raíz del proyecto (`ProyectoFerriplus/`) y ejecuta:
    ```bash
    ant clean build
    ```

3.  **Ejecuta la aplicación:**
    Después de una compilación exitosa, puedes ejecutar la aplicación directamente desde el IDE (NetBeans) o desde la línea de comandos:
    ```bash
    java -jar dist/ProyectoBases.jar # Ajusta 'ProyectoBases.jar' si el nombre es diferente
    ```
    El punto de entrada principal para la ejecución suele ser la clase con el método `main` que inicia tu interfaz de usuario o la lógica principal de la aplicación.
