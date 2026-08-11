# Guía de Exportación de Máquinas Virtuales

Este documento detalla el proceso ideal para construir y exportar ambas máquinas virtuales (Server y Cliente) de la manera más limpia y eficiente posible, garantizando que ambas partan del mismo entorno de sistema base.

### Fase 1: Preparar la VM Server base

1. Finalizá la instalación limpia de [Ubuntu Server 26.04 LTS](https://releases.ubuntu.com/26.04/) en una nueva máquina virtual.
2. Ingresá, cloná este repositorio y ejecutá **únicamente** el script del servidor:
   ```bash
   sudo bash -x base-server.sh
   ```
3. Limpiá la caché de `apt` y el historial de comandos para reducir el tamaño al máximo:
   ```bash
   sudo apt clean
   sudo apt autoremove -y
   history -c
   ```
4. Finalmente, ejecutá el script que borra el identificador único de la máquina y la apaga:
   ```bash
   sudo ./machine-id-delete.sh
   ```
   > **Nota Crítica:** Borrar el `machine-id` asegura que cuando los alumnos importen la VM, su sistema operativo genere un ID nuevo. Esto evita conflictos de red e IPs duplicadas entre ellos.

### Fase 2: Clonar y Exportar la Server

5. Una vez que la VM esté apagada, cloná esa máquina virtual desde el gestor (ej. VirtualBox) y nombrala como `UTN_SO_Server_26.04`.
6. Seleccioná la VM clonada y utilizá la opción de **Exportar Servicio Virtualizado** (`File -> Export Appliance`) para guardarla como un archivo `.ova`. ¡Lista la primera!

### Fase 3: Preparar la VM Client (Gráfica)

7. Volvé a la VM original (la que no clonaste) y encendela. Al bootear, generará un nuevo `machine-id` automáticamente.
8. Una vez adentro, ejecutá los scripts para instalar la interfaz gráfica y el tema:
   ```bash
   ./interfaz-grafica.sh
   ./theme.sh
   ```
9. _(Opcional pero muy recomendado)_: Como esta es la VM gráfica, instalale las **Guest Additions** del hipervisor (ej. VirtualBox) para habilitar el portapapeles compartido y el redimensionado automático de pantalla.
10. Repetí el proceso de limpieza y borrado de ID para apagarla:
    ```bash
    sudo apt clean
    sudo apt autoremove -y
    history -c
    cd entorno-vms
    sudo ./machine-id-delete.sh
    ```

### Fase 4: Exportar la Client

11. Con la VM apagada, renombrala (si querés) a `UTN_SO_Client_26.04` para mayor claridad.
12. Utilizá la opción de **Exportar Servicio Virtualizado** para exportar esta máquina como tu segundo archivo `.ova`.

De esta forma obtenés los dos archivos `.ova` listos para distribuir a los alumnos, ahorrando tiempo y garantizando una base estable y unificada para todos.
