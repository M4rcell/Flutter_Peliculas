
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  final siguientePagina;

  // escuchar todo los cambios
   final _pageController= new PageController(
      initialPage: 1,
      viewportFraction: 0.27
   );

  //constructor
  MovieHorizontal({@required this.peliculas,@required this.siguientePagina});
  
  @override
  Widget build(BuildContext context) {
    //para saber cual es el tamaño de esa vemtana
    final _screenSize = MediaQuery.of(context).size;

 // se dispara cada vez que se mueva el scroll horizonal
   _pageController.addListener((){

  // si la posicion actual es mayor o ingual a la posicion maxima -200
     if (_pageController.position.pixels >= _pageController.position.maxScrollExtent-200) {
       
       //cargar las siguientes peliculas
       siguientePagina();

     }


   });

    return Container(
      height: _screenSize.height * 0.2,
      // lista de Scrooll
      
      //PageView = rendereza todo el listado de peliculas de forma simultaneo
      //PageView.Builder = renderiza deacuerdo si es necesario.
      child: PageView.builder(
        pageSnapping: false,
        controller:_pageController,
       // children: _tarjetas(context),
       itemCount: peliculas.length,
       itemBuilder: (context,i){
         return _targeta(context,peliculas[i]);
       },
      ),

      
    );

  }


  Widget _targeta(BuildContext context,Pelicula pelicula){

     pelicula.uniqueId ='${pelicula.id}-poster';

    
      final tarjeta = Container(
        margin: EdgeInsets.only(right: 30.0),
        child: Column(
          children: <Widget>[
            //Hero animacion en posters tag ingual
             Hero(
               tag: pelicula.uniqueId,
                 child: ClipRRect(
                 borderRadius: BorderRadius.circular(20.0),
                 child: FadeInImage(
                   placeholder: AssetImage('assets/img/no-image.jpg'),
                    image: NetworkImage(pelicula.getPosterImg()),
                    fit: BoxFit.cover,
                    height: 100.0,
            ),
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


      return GestureDetector(
        child: tarjeta,
        onTap: (){

          print('ID de la pelicula ${pelicula.id}');
          // ir de una pagina a otra
         // enviando a la lista de peliculas
          Navigator.pushNamed(context, 'detalle',arguments: pelicula);

        },
      );
  }

  
//******************** NO SE UTILIZA********************************
  List<Widget> _tarjetas(BuildContext context){
    // retorna una lista de peliculas
    return peliculas.map( (pelicula){

      // return Container(
      //   margin: EdgeInsets.only(right: 30.0),
      //   child: Column(
          
      //     children: <Widget>[
      //        ClipRRect(
      //          borderRadius: BorderRadius.circular(20.0),
      //          child: FadeInImage(
      //            placeholder: AssetImage('assets/img/no-image.jpg'),
      //             image: NetworkImage(pelicula.getPosterImg()),
      //             fit: BoxFit.cover,
      //             height: 100.0,
      //       ),
      //       ),
             
      //        Text(
      //          pelicula.title,
      //          overflow:TextOverflow.ellipsis,
      //          style:Theme.of(context).textTheme.caption,
      //        )
      //     ],
      //   ),
      // );

    }).toList();//Convierte a una lista
  }
}