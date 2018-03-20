# Proyecto 1: Computador con sistema multiprocesador heterogéno
Sistema Heterogéneo de procesamiento: ARM Cortex + Procesador Vectorial.

Sistema encripta y desencripta imágenes utilizando diferentes algoritmos.

El proyecto es implementado en la tarjeta de desarrollo Terasic DE1-SoC.
El procesador vectorial es implementado en una FPGA mientras que la aplicación de procesamiento de imágenes fue implementada en C++ utilizando OpenCV.

## Compilación del programa

Para construir y ejecutar el programa requiere [CMake](https://cmake.org/download/) o superior.

```
mkdir build && cd build
cmake ..
make
./DisplayImage
```

## Más información

Instituto Tecnológico de Costa Rica

Área Académica de Ingeniería en Computadores

**Curso**: Arquitectura de Computadores II

**Profesor**: M.Sc. Jeferson González Gómez

**Integrantes:**

* Andrés Arias
* David Badilla
* Jairo Méndez
* Stiven Sánchez