
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
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(pelicula)
        ],

      )
            
    );
  }


  Widget _crearAppbar( Pelicula pelicula){
    // es similar a appBar
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      //Altura de AppBar
      expandedHeight:200.0,
      floating:false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle:true,
        title: Text(
          pelicula.title,
          style: TextStyle(color:Colors.white,fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.jpg'),
          fadeInDuration:Duration(microseconds:200) ,
          fit: BoxFit.cover,
          width: 100.0,
        ),
      ),
    );


  }
}