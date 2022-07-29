# SisOp VMs - Work In Progress --> 2c2022

> Este repositorio contiene scripts y recursos que estan siendo testeados y NO SE RECOMIENDA SU UTILIZACION. No se brindará soporte para estos scripts hasta que no se encuentren liberadas las VMs 6.0

Este repositorio contiene los archivos para generar el ambiente de la máquina virtual de Sistemas Operativos UTN FRBA en cualquier instalación de Ubuntu. Se recomienda partir de una instalanción limpia de [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server).

También incluye un tema para Xfce agregando los paquetes necesarios para poder servir como entorno de desarrollo del trabajo práctico.

![result](.img/result.png)

1. Instalar los paquetes de la VM server solamente

```bash
wget -qO- https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/base-server.sh | bash -x
```

2. Instalar el entorno gráfico

```bash
wget -qO- https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/interfaz-grafica.sh | bash -x
```

3. Instalar el tema

```bash
wget -qO- https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/theme.sh | bash -x
```

4. Reiniciar el sistema (asumiendo que estamos en una terminal)
```bash
reboot
```

5. [Instalar las guest additions](https://faq.utnso.com.ar/guest-additions) y reiniciar de nuevo

6. Agregar nuestro usuario al grupo `vboxsf`

```bash
sudo adduser $USER vboxsf
```

## Instalar IDEs

- Visual Studio Code y Eclipse ya vienen instalados.

- CLion (ver [requisitos mínimos]):
```
wget -qO- https://raw.githubusercontent.com/sisoputnfrba/entorno-vms/main/clion.sh | bash -x
```

[requisitos mínimos]: https://www.jetbrains.com/help/clion/installation-guide.html

## Contributors

- Damian Facchini [@iago64](https://github.com/iago64)
- Agustín Ranieri [@RaniAgus](https://github.com/RaniAgus)
