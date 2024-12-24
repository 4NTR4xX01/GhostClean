# GhostClean

![Banner](/images/Banner.png)

### By: 4NTR4xX

**GhostClean** es una herramienta de monitoreo diseñada para capturar, mostrar y eliminar de manera segura todos los comandos ejecutados en un terminal, garantizando que no queden rastros recuperables. Es ideal para pruebas de penetración o auditorías de seguridad.

---

## 🚀 Características

- Captura y muestra en tiempo real los comandos ejecutados.
- Monitorea directorios importantes para detectar nuevos logs.
- Elimina de manera segura los registros con `shred`.
- Incluye cifrado opcional de archivos temporales.
- Fácil de instalar y usar en entornos basados en Linux.

---

## 📋 Requisitos

Antes de usar esta herramienta, asegúrate de que tu sistema cumpla con los siguientes requisitos:

1. **Sistema Operativo:** Linux (recomendado).
2. **Permisos:** Ejecución con `sudo` para monitorear directorios del sistema.
3. **Dependencias:**
   - `shred` - Para la eliminación segura de archivos.
   - `inotify-tools` - Para monitorear la creación de logs.

---

## 🛠️ Instalación

```bash
sudo apt update
sudo apt install -y shred inotify-tools
git clone https://github.com/4NTR4xX01/GhostClean.git
cd GhostClean
chmod +x GhostClean.sh
```

## Uso

Para iniciar el monitoreo y registro de comandos, simplemente ejecuta el script:

```bash
sudo ./GhostClean.sh
```

### Opciones disponibles

1. Captura de comandos: Registra cada comando ejecutado en el terminal.
2. Monitoreo de directorios: Detecta nuevos archivos de log en /var/log/, /tmp/, y tu directorio personal.
3. Eliminación segura: Borra los registros y archivos relacionados de forma irrecuperable.


## ⚠️ Advertencias
**Uso responsable:** Esta herramienta está diseñada para pruebas de seguridad en entornos controlados. Asegúrate de tener permiso antes de utilizarla.
**Cuidado con sudo:** Como se ejecuta con permisos elevados, asegúrate de entender las implicaciones.


## 🤝 Contribuciones
¡Las contribuciones son bienvenidas! Si deseas mejorar esta herramienta, por favor crea un fork del proyecto y envía un pull request.

## 📧 Contacto
Si tienes preguntas o sugerencias, no dudes en contactarme a través de 4ntr4xxoficial01@gmail.com

