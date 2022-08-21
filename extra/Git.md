# Comandos usados en Git Bash [^1]
[^1]: Video de Giten VSC vs. Linea de Comando de Git[YouTube](https://youtu.be/AYbgqmyg7dk)

## [Inicialización de un repositorio](https://git-scm.com/book/es/v2/Fundamentos-de-Git-Obteniendo-un-repositorio-Git)

```
git init
```

...o si el repositorio está creado en GitHub

```
git clone [url]
```
ver [clonar un repositorio](https://docs.github.com/es/repositories/creating-and-managing-repositories/cloning-a-repository)
___

## [Configuración de Git](https://git-scm.com/book/es/v2/Personalizaci%C3%B3n-de-Git-Configuraci%C3%B3n-de-Git): `user.name` y `user.email`
<br>

```
git config --global user.name "MaodeColombia"
git config --global user.email alanbriton@example.com
```
>Importante:  
>`user.name` debe ser la cuenta de de GitHub

<br>
<br>

## Confirmar la configuración de `user` y `email`
<br>

```
git config --list
```
___


## [Las URLs que Git tiene asociadas](https://git-scm.com/book/es/v2/Fundamentos-de-Git-Trabajar-con-Remotos)

```
git remote -v
```

