# SisOp VMs

Este repositorio contiene los archivos para generar el ambiente de la máquina virtual de Sistemas Operativos UTN FRBA en cualquier instalación de Ubuntu. Se recomienda partir de una instalanción limpia de [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server).

> Los scripts no han sido probados para partir desde una instalación limpia de [Ubuntu Server 22.04 for ARM](https://ubuntu.com/download/server/arm), pero también podrían funcionar.

También incluye un tema para Xfce agregando los paquetes necesarios para poder servir como entorno de desarrollo del trabajo práctico.

![result](.img/result.png)

1. Instalar los paquetes de la VM server solamente

```bash
wget -qO- https://faq.utnso.com.ar/base-server.sh | bash -x
```

2. Instalar el entorno gráfico

```bash
wget -qO- https://faq.utnso.com.ar/interfaz-grafica.sh | bash -x
```

3. Instalar el tema

```bash
wget -qO- https://faq.utnso.com.ar/theme.sh | bash -x
```

4. Reiniciar el sistema (asumiendo que estamos en una terminal)
```bash
reboot
```

### VirtualBox

5. [Instalar las guest additions](https://faq.utnso.com.ar/guest-additions) y reiniciar de nuevo

6. Agregar nuestro usuario al grupo `vboxsf`

```bash
sudo adduser $USER vboxsf
```

## Instalar IDEs

- Visual Studio Code y Eclipse ya vienen instalados.

- CLion (ver [requisitos mínimos]):
```
wget -qO- https://faq.utnso.com.ar/clion.sh | bash -x
```

[requisitos mínimos]: https://www.jetbrains.com/help/clion/installation-guide.html

## Contributors

- Damian Facchini [@iago64](https://github.com/iago64)
- Agustín Ranieri [@RaniAgus](https://github.com/RaniAgus)
