
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiper extends StatelessWidget {

  // lista de peliculas
  final List<dynamic> peliculas;

  //inicializar en el constructor de lista de peliculas
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    // mediaquerr de dispositivo
    final _screenSize= MediaQuery.of(context).size;
    

    return Container(
       padding:EdgeInsets.only(top:10.0),
       
       child:new Swiper(
          layout: SwiperLayout.STACK,
         //dimenciones de swiper
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context,int index){
            //ClipRRect para tener bordes redondeados
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: new Image.network("http://via.placeholder.com/350x150",
              fit: BoxFit.cover,));
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),
         // control: new SwiperControl(),
        ),
     );
  }
}