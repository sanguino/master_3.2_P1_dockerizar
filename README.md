# master_3.2_P1_dockerizar


Se ha dockerizado la aplicación que ya teniamos de una asignatura anterior.


## EoloPlanner, descripción original de la practica

Este proyecto es una aplicación distribuida formada por diferentes servicios que se comunican entre sí usando API REST, gRPC y RabbitMQ. La aplicación ofrece un interfaz web que se comunica con el servidor con API REST y WebSockets. 

Algunos servicios están implementados con Node.js/Express y otros con Java/Spring. Estas tecnologías deben estar instaladas en el host para poder construir y ejecutar los servicios. También se requiere Docker para ejecutar los servicios auxiliares (MySQL, MongoDB y RabbitMQ).

Para la construcción de los servicios y su ejecución, así como la ejecución de los servicios auxiliares requeridos se usan scripts implementados en Node.js. Posiblemente no sea el lenguaje de scripting más utilizado para este caso de uso, pero en este caso concreto facilita la interoperabilidad en varios SOs y es sencillo.

Esta solución está basada en el trabajo entregado por el alumno Miguel García Sanguino.


## Desarrollo en local

Para el desarrollo en local todos los servicios tienen un `.devcontainer` configurado con todo lo necesario. 

Lo primero que necesitaremos es iniciar MongoDB, MySQL y RabbitMQ, para ello usamos el docker-compose de desarrollo:


```
$ docker-compose -f docker-compose-dev.yml up -d
```

El `.devcontainer` de cada servicio esta configurado para usar la red host, y con las variables de entorno necesarias para poder ejecutar el servicio directamente desde una terminal desde dentro del contenedor de desarrollo:

#### toposervice

```
$ mvn spring-boot:run
```

#### weatherservice

```
$ node src/server.js
```

#### planner

```
$ mvn spring-boot:run
```
> si se quiere probar las llamadas a weatherservice y toposervice se deben levantar estos servicios antes.

#### server

```
$ node src/server.js
```

## Publicar las imagenes en docker hub

Para publicar las imagenes en docker hub se debe ejecutar el script:


```
$ ./buildAndPublish.sh
```

Se puede cambia la variable `$DOCKER_HUB_USER` para publicar las imagenes en otra cuenta.


## Ejecutar en modo producción

Se ejecutara el docker-compose yaml de forma normal. Todas las variables de entorno estan definidas en el fichero `production.env`

```
$ docker-compose up -d
```

