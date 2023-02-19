import 'package:flutter/Material.dart';

class Carte extends StatelessWidget {
  late String ref;
  late String photo;
  late String titre;
  late String description;
  late String prix;

  Carte(String uneRef, String unePhoto, String unTitre, String uneDescription,
      String unPrix) {
    this.ref = uneRef;
    this.photo = unePhoto;
    this.titre = unTitre;
    this.description = uneDescription;
    this.prix = unPrix;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
      width: 250,
      child: (Column(children: <Widget>[
        Container(  
          child: Image.asset(
            photo,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              titre,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              prix,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Text(
            description,
            textAlign: TextAlign.justify,
          ),
        ),
      ])),
    ));
  }
}
