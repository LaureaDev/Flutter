
enum FromWho { me, hers}


class Message {

  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  //Fecha,hora,leido o no, etc!

  Message ({
    required this.text,
    this.imageUrl,
    required this.fromWho
  });
}