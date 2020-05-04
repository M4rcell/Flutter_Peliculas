
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{


  String seleccion ="";

  final peliculas =[
    'Spiderman',
    'Aquaman',
    'Batman',
    'Iroman',
    'Capitan America',
    'Superman',
    'Iroman 2',
    'Iroman 3',
    'Iroman 4',
    'Iroman 5',
    'Iroman 6',

  ];

  final peliculasRecientes=[
    'Spiderman',
    'Capitan America'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //las acciones de nuestro appBar
    
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
         // print("CLICK !!!");
          // limpiar el buscador
           query = '';
        }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la iquierda del AppBar
    return IconButton(
      icon:AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation,
      ), 
      onPressed: (){
         // print("Leanding Icons Press");
          //regresar a la pantalla principal
          close(context, null);

        },
    ); 

        
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builders que crea los resultados que vamos a mostrar
  
   return Center(
     child: Container(
       height: 100.0,
       width: 100.0,
       color: Colors.blueAccent,
       child: Text(seleccion),
     )
   );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe

     final listaSugerida = (query.isEmpty) //si la pelicula esta vacia 
                           ?peliculasRecientes// regresa
                           :peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())
                           ).toList();// retorna todo lo coincidente a lo escrito
                           //regresa un iterable 

      return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder:(context,i){
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: (){
            // muestra lo seleccionado
            seleccion =listaSugerida[i];
            //contrue el resultado
              showResults(context);
          },
        );

      } ,
    );

  }


}