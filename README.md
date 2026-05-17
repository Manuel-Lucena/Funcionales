# Sistema de Gestión de Talleres - Aula Viva (TFG)

Este repositorio contiene la arquitectura de despliegue y el código fuente para el sistema de gestión de talleres de Aula Viva, desarrollado como Proyecto de Fin de Grado. La aplicación está diseñada bajo una arquitectura de componentes desacoplados y preparada para entornos cloud mediante Kubernetes.

---

## Descripción del Proyecto

El sistema permite automatizar la gestión de alumnos, reservas, asistencias y publicación de materiales/tareas relacionadas con los talleres del centro Aula Viva. Al estar contenerizada y orquestada, la aplicación garantiza una alta disponibilidad, aislamiento de procesos y tolerancia a fallos.

---

## Arquitectura del Sistema

La infraestructura está automatizada en Kubernetes y se compone de los siguientes elementos:

* **Frontend:** Aplicación SPA (Angular) servida mediante un proxy inverso Nginx optimizado con políticas de control de caché.
* **Backend:** API REST (Java / Spring Boot) que gestiona la lógica de negocio y la persistencia de datos.
* **Base de Datos:** Motor relacional MySQL comunicado de forma interna de manera aislada.
* **Almacenamiento:** Volúmenes persistentes (PVC) para asegurar la persistencia de datos de MySQL y los archivos subidos (materiales, entregas e imágenes).
* **Escalabilidad:** Autoescalado horizontal (HPA) basado en el consumo de CPU tanto para el flujo web como para la API.

---

## Requisitos Previos

Para poder ejecutar y probar este despliegue es necesario contar con las siguientes herramientas instaladas:

* Git
* Docker Desktop
* Minikube o un clúster de Kubernetes funcional
* Kubectl (CLI de Kubernetes)

---

## Instrucciones de Despliegue en Local (Minikube)

Para levantar todo el entorno de Kubernetes en un clúster local, ejecuta los siguientes comandos en orden:

### 1. Clonar el repositorio

git clone [https://github.com/Manuel-Lucena/Proyecto_Talleres_TFG.git](https://github.com/Manuel-Lucena/Proyecto_Talleres_TFG.git)
cd Proyecto_Talleres_TFG


### 2. Ejecutar comandos de Kubernetes

# Crear volúmenes persistentes
kubectl apply -f mysql-pvc.yaml

# Desplegar credenciales y servicio de Base de Datos
* kubectl apply -f mysql-deployment.yaml
* kubectl apply -f mysql-service.yaml
* kubectl apply -f nginx-configmap.yaml

# Backend (API Java)
* kubectl apply -f backend-deployment.yaml
* kubectl apply -f backend-service.yaml

# Frontend (Web Angular)
* kubectl apply -f frontend-deployment.yaml
* kubectl apply -f frontend-service.yaml

# Activar el Autoescalado Horizontal (HPA)
* kubectl apply -f hpa-config.yaml
* Tecnologías Utilizadas
* Frontend: Angular, Nginx

Backend: Java, Spring Boot

Base de Datos: MySQL

Orquestación y Cloud: Kubernetes, Docker

Herramientas de Desarrollo: Mailtrap (Pruebas de pasarela de correo)
