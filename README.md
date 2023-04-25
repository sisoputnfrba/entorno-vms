# SisOp VMs

Este repositorio contiene los archivos para generar el ambiente de la máquina virtual de Sistemas Operativos UTN FRBA en cualquier instalación de Ubuntu. Se recomienda partir de una instalanción limpia de [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server).

> Los scripts no han sido probados para partir desde una instalación limpia de [Ubuntu Server 22.04 for ARM](https://ubuntu.com/download/server/arm), pero también podrían funcionar.

También incluye un tema para Xfce agregando los paquetes necesarios para poder servir como entorno de desarrollo del trabajo práctico.

![result](.img/result.png)

## Instalación

La instalación consiste en ejecutar una serie de scripts. Es importante ejecutar cada comando al pie de la letra para que la ejecución se realice correctamente.

Para más información sobre cómo funciona cada comando a ejecutar, podés consultar [esta explicación](https://explainshell.com/explain?cmd=curl+-fsSL+example.org+%7C+sh+-x).

1. Instalar los paquetes de la VM server solamente

```bash
curl -fsSL https://faq.utnso.com.ar/base-server.sh | sudo sh -x
```

2. Instalar el entorno gráfico XFCE, Eclipse y Visual Studio Code

```bash
curl -fsSL https://faq.utnso.com.ar/interfaz-grafica.sh | sh -x
```

3. Instalar el tema (opcional)

```bash
curl -fsSL https://faq.utnso.com.ar/theme.sh | sh -x
```

4. Reiniciar el sistema
```bash
reboot
```

## Extras

- Instalar drivers de virtualización para mejorar la interacción entre VM y Host
  - Para VirtualBox: [instalar las Guest Additions](https://docs.utnso.com.ar/primeros-pasos/entorno-linux.html#instalar-las-guest-additions)
  - Para UTM: [instalar las Spice Guest Agent Tools](https://youtu.be/hnwK-nkXolc?t=527)

- Instalar CLion IDE (solo si contamos con los [requisitos recomendados](https://www.jetbrains.com/help/clion/installation-guide.html))
```bash
curl -fsSL https://faq.utnso.com.ar/clion.sh | sh -x
```

## Contributors

- Damian Facchini [@iago64](https://github.com/iago64)
- Agustín Ranieri [@RaniAgus](https://github.com/RaniAgus)
