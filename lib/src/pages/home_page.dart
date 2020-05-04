
import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';


class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

  //llama el listado de polulares
  peliculasProvider.getPopulares();

    return Scaffold(
      appBar:AppBar(
        centerTitle: false,
        title:Text('Peliculas en cine'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){
              showSearch(
                context: context, 
                //llamando a la clase DataSearch
                delegate: DataSearch(),
                //nombre por defectoen buscador
                //query: 'Hola',

              );
            },
          ),
        ],

      ),
      body:Container(
        child: Column(
          // separacio entre elementos
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //Widget Personalisados
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
 
      ),
      
    );
  }

   Widget _swiperTarjetas(){

    //utiliza el snipers "fub" para generar de forma automatica el codigo
    return FutureBuilder(
      // llamando la lista de peliculas
      future: peliculasProvider.getEnCines(),
      //initialData: InitialData,
      //AsyncSnapshot retorna una lista de peliculas
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

       //si snapshot contiene una lista de peliculas
        if (snapshot.hasData) {
  
          return CardSwiper(peliculas: snapshot.data);
          
        }
        else {
          // si no mostrar un circular progresess en el medio cuando no hay informacion o el future se esta resolviendo
          
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
              )
          );
        }
         
        
      },
    );
   }

   Widget _footer( BuildContext context){

     return Container(
       //ocpuar todo  el espacio de horizontal
       width: double.infinity,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,         
         children: <Widget>[
         Container(
           padding: EdgeInsets.only(left: 20.0),
           child: Text('Populares',style:Theme.of(context).textTheme.subhead),),
           SizedBox(height: 5.0,),
            
            //FutureBuilder = solo se ejecuta una sola vez
            // StreamBuilder =  se ejecuta  cada vez haya un cambio
           StreamBuilder(
             stream: peliculasProvider.popularesStream,
             //initialData: [],
             //future: peliculasProvider.getPopulares(),
             //initialData: InitialData,
             builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

              // print(snapshot.data);
              // mostrar el titulo de peliculas
              // has el ForEach()  si existe data
              //snapshot.data?.forEach((p) => print(p.title));

              //Si viene data
              if (snapshot.hasData) {

                // enviar al constructor MovieHorizontal de movie horizonal
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares,
                  );
                
              }
              else{

                return Center(child: CircularProgressIndicator());
              }

             // return Container();

             },
           ),
         ],
       ),

     );
   }
}