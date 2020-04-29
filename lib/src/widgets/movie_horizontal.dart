
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  //constructor
  MovieHorizontal({@required this.peliculas});
  
  @override
  Widget build(BuildContext context) {
    //para saber cual es el tamaño de esa vemtana
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      // lista de Scrooll
      child: PageView(
        pageSnapping: false,
        controller:PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ) ,
        children: _tarjetas(context),
      ),

      
    );

  }

  List<Widget> _tarjetas(BuildContext context){
    // retorna una lista de peliculas
    return peliculas.map( (pelicula){

      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          
          children: <Widget>[
             ClipRRect(
               borderRadius: BorderRadius.circular(20.0),
               child: FadeInImage(
                 placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                  height: 100.0,
            ),
            ),
             
             Text(
               pelicula.title,
               overflow:TextOverflow.ellipsis,
               style:Theme.of(context).textTheme.caption,
             )
          ],
        ),
      );

    }).toList();//Convierte a una lista
  }
}