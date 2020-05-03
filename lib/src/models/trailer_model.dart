
class Videos{

  List<Trailer> trailers = new List();

  Videos.fromJsonjList( List<dynamic> jsonList )
  {
    if (jsonList == null) return;

    jsonList.forEach((item){

        final trailer = Trailer.fromJsonMap(item);
        trailers.add(trailer);
      
  

    });
  }

}

class Trailer {

  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  String site;
  int  integer;

  Trailer({
    this.id,
    this.iso_639_1,
    this.iso_3166_1,
    this.key,
    this.name,
    this.site,
    this.integer

  });

  Trailer.fromJsonMap(Map<String,dynamic>json){

   id          = json['id'];
   iso_639_1   = json['iso_639_1'];
   iso_3166_1  = json['iso_3166_1'];
   key         = json['key'];
   name        = json['name'];
   site        = json['site'];
  integer      = json['integer'];

  }
  getVideo(){

    if (key == null) {

       return 'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg';
    }
    else {
              // https://image.tmdb.org/t/p/w500/
        return 'https://www.youtube.com/watch?v=$key';

    }
  }

}