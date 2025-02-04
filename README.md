# SisOp VMs

Este repositorio contiene los archivos para generar el ambiente de la máquina virtual de Sistemas Operativos UTN FRBA en cualquier instalación de Ubuntu. Se recomienda partir de una instalación limpia de [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) o [su versión para computadoras con procesador ARM](https://ubuntu.com/download/server/arm).

También incluye un tema para Xfce agregando los paquetes necesarios para poder servir como entorno de desarrollo del trabajo práctico.

![result](.img/result.png)

## Instalación

La instalación consiste en ejecutar una serie de scripts que se encuentran en este mismo repositorio.

Para ello, necesitamos tener `git` instalado:

```bash
sudo apt install -y git
```

Luego, nos clonamos el repo y seguimos los pasos enumerados a continuación:

```bash
git clone https://github.com/sisoputnfrba/entorno-vms
cd entorno-vms
```

1. Instalar los paquetes de la VM server solamente

```bash
sudo bash -x base-server.sh
```

2. Instalar el comando `ifconfig` al iniciar una terminal (opcional)

```bash
printf "\nifconfig\n" >> ~/.bashrc
```

3. Instalar el entorno gráfico XFCE, Eclipse y Visual Studio Code

```bash
./interfaz-grafica.sh
```

4. Instalar el tema (opcional)

```bash
./theme.sh
```

5. Reiniciar el sistema
```bash
reboot
```

## Extras

- Instalar drivers de virtualización para mejorar la interacción entre VM y Host
  - Para VirtualBox: [instalar las Guest Additions](https://docs.utnso.com.ar/primeros-pasos/entorno-linux.html#instalar-las-guest-additions)
  - Para UTM: [instalar las Spice Guest Agent Tools](https://youtu.be/hnwK-nkXolc?t=527)

- Instalar CLion IDE (solo si contamos con los [requisitos recomendados](https://www.jetbrains.com/help/clion/installation-guide.html))
```bash
./clion.sh
```

- Instalar la últiam versión estable de Go
```bash
./golang.sh
```

## Contributors

- Damian Facchini [@iago64](https://github.com/iago64)
- Agustín Ranieri [@RaniAgus](https://github.com/RaniAgus)
