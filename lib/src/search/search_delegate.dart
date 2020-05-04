
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context) {
    //las acciones de nuestro appBar
    
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          //print("CLICK !!!");
          // limpiar el buscador
           query = '';
        })
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
             
          //print("Leanding Icons Press");
          //regresar a la pantalla principal
          close(context, null);

        }
    ); 
    
  }

  @override
  Widget buildResults(BuildContext context) {
    // Builders que crea los resultados que vamos a mostrar
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    return null;
  }


}