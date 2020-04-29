
import 'dart:convert';

import 'package:http/http.dart' as  http;

import 'package:peliculas/src/models/pelicula_model.dart';



class PeliculasProvider{

  
 String _apikey    = 'caae07fa3cbe7d5ced7cbe2dfaef0b5b';
 String _url       = 'api.themoviedb.org';
 String _languaje  = 'es-ES';


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

   final url = Uri.https(_url, '3/movie/popular',{
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
  print('Message de Populares()');
  print(peliculas.items[10].title);
  print(peliculas.items[10].title);

  
 

 // returna una lista de peliculas ya mapeadas lito para ser usados
  return peliculas.items; */
    
   
 }

}