
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

// final Pelicula pelicula;

// PeliculaDetalle(this.pelicula);

  @override
  Widget build(BuildContext context) {

   // recibiendo la lista pelicula encio entre pantallas
   final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(pelicula.title ),

      ),
      
    );
  }
}