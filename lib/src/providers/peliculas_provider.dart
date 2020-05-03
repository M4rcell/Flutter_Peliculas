
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as  http;
import 'package:peliculas/src/models/actores_model.dart';

import 'package:peliculas/src/models/pelicula_model.dart';



class PeliculasProvider{

  
 String _apikey    = 'caae07fa3cbe7d5ced7cbe2dfaef0b5b';
 String _url       = 'api.themoviedb.org';
 String _languaje  = 'es-ES';

 // cambiar numero de paginas
 int  _popularesPage = 0;

//para cargar poco a poco
 bool _cargando      = false;

 //Listado de peliculas
 List<Pelicula> _populares = new List();

// lista de stream de peliculas  solo la tuberia
// broadcast muchos escuchando
final _populareStreamController = StreamController<List<Pelicula>>.broadcast();
 
 // funcion que recibe una lista de peliculas
 // sink proceso para introducir peliculas
Function (List<Pelicula>) get popularesSink => _populareStreamController.sink.add;

//Escuchar peliculas
Stream <List<Pelicula>> get popularesStream => _populareStreamController.stream;


void disposeStream(){
  // ? si vienes algun valor cerrar
  _populareStreamController?.close();

}




 Future <List<Pelicula>> _procesarRespuesta(Uri url) async{

    final resp =  await http.get(url);

  final datadecode = json.decode(resp.body);
  
// para mostrar toda la lista de peliculas
 // print(datadecode['results']);

 //este constructor encargar de barrer todo la lista y generar las peliculas
 final peliculas = new Peliculas.fromJsonList(datadecode['results']);

  // obteniendo el nombre de pelicula
  print('Message del metodo getEnCines()');
  print(peliculas.items[10].title);
  print(peliculas.items[10].title);

  
 

 // returna una lista de peliculas ya mapeadas lito para ser usados
  return peliculas.items;
    

}

 
 Future<List<Pelicula>> getEnCines()async{

   final url = Uri.https(_url, '3/movie/now_playing',{
     'api_key'  : _apikey,
     'language' : _languaje

  

   });

   return await _procesarRespuesta(url);
/* 
  // return await _procesarRespuesta(url);
   
  // await _ es para esperar que haga ese solicitud
  final resp =  await http.get(url);

  final datadecode = json.decode(resp.body);
  
// para mostrar toda la lista de peliculas
 // print(datadecode['results']);

 //este constructor encargar de barrer todo la lista y generar las peliculas
 final peliculas = new Peliculas.fromJsonList(datadecode['results']);

  // obteniendo el nombre de pelicula
  print('Message del metodo getEnCines()');
  print(peliculas.items[10].title);
  print(peliculas.items[10].title);

  
 

 // returna una lista de peliculas ya mapeadas lito para ser usados
  return peliculas.items; */
    
   
 }
 Future<List<Pelicula>> getPopulares()async{

   if (_cargando) {
       return [];
   }
   else{
     _cargando=true;
   }

 _popularesPage ++;

 print("Cargando Siguientes ....... ");

   final url = Uri.https(_url, '3/movie/popular',{
     'api_key'  : _apikey,
     'language' : _languaje,
     'page'     : _popularesPage.toString(),

   });
  //recibiendo una lista depeliculas
  final resp = await _procesarRespuesta(url);

  //agregar y almacenar peliculas
  _populares.addAll(resp);

   //mandarlo y colocarlo al inicio de datos
   popularesSink(_populares);

   _cargando= false;

   return resp;
  
   //return await _procesarRespuesta(url);




/* 
  // return await _procesarRespuesta(url);
   
  // await _ es para esperar que haga ese solicitud
  final resp =  await http.get(url);

  final datadecode = json.decode(resp.body);
  
// para mostrar toda la lista de peliculas
 // print(datadecode['results']);

 //este constructor encargar de barrer todo la lista y generar las peliculas
 final peliculas = new Peliculas.fromJsonList(datadecode['results']);

  // obteniendo el nombre de pelicula
  print('Message de Populares()');
  print(peliculas.items[10].title);
  print(peliculas.items[10].title);

  
 

 // returna una lista de peliculas ya mapeadas lito para ser usados
  return peliculas.items; */
    
   
 }

 Future<List<Actor>> getCast(String peliId) async{

   final  url = Uri.http(_url, '3/movie/$peliId/credits',{

     'api_key'  : _apikey,
     'language' : _languaje,

   });
  // await se utiliza par esperar la respuesta
   final  resp = await http.get(url);//llmando la respuesta
   final decodeData = json.decode(resp.body);//almacena una mapa

   final cast = new Cast.fromJsonList(decodeData['cast']);//mandamos ladata de su propiedad [cast]

   return cast.actores;


 }

}