import 'package:flutter/material.dart';

import './carte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const MyHomePage(title: 'Pâtisserie Royale'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  var gateaux = [
    {
      'ref': '1',
      'photo': 'saint_valentin.jpg',
      'titre': 'Saint Valentin',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales nibh id posuere lacinia. Etiam semper odio quam, id maximus lacus hendrerit ut.',
      'prix': '50 \$',
      'ingredients': [
        'Crême au beurre',
        'Ganache au chocolat',
        'Gelée de fruits'
      ]
    },
    {
      'ref': '2',
      'photo': 'anniversaire.jpg',
      'titre': 'Anniversaire',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales nibh id posuere lacinia. Etiam semper odio quam, id maximus lacus hendrerit ut.',
      'prix': '60 \$',
      'ingredients': ['Crême au beurre', 'Vanille', 'Caramelle']
    },
    {
      'ref': '3',
      'photo': 'buche_noel.jpg',
      'titre': 'Bûche de Noël',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales nibh id posuere lacinia. Etiam semper odio quam, id maximus lacus hendrerit ut.',
      'prix': '60 \$',
      'ingredients': ['Crême au beurre Vanille et Chocolat', 'Confitures']
    },
    {
      'ref': '4',
      'photo': 'cupcake_halloween.jpg',
      'titre': 'Cupcake Halloween',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales nibh id posuere lacinia. Etiam semper odio quam, id maximus lacus hendrerit ut.',
      'prix': '40 \$',
      'ingredients': ['Chocolat', 'Crême au beurre', 'Amandes']
    },
    {
      'ref': '5',
      'photo': 'foret_noire.jpg',
      'titre': 'Forêt Noire',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales nibh id posuere lacinia. Etiam semper odio quam, id maximus lacus hendrerit ut.',
      'prix': '40 \$',
      'ingredients': ['Crême Chantilly', 'Cérises', 'Chocolat']
    },
    {
      'ref': '6',
      'photo': 'mariage.jpg',
      'titre': 'Gâteau Mariage',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales nibh id posuere lacinia. Etiam semper odio quam, id maximus lacus hendrerit ut.',
      'prix': '100 \$',
      'ingredients': ['Crême au beurre', 'Crêmeux au chocolat', 'Coulis']
    },
  ];

  void onPreviews() {
    setState(() {
      if (index > 0 && index <= gateaux.length) {
        index--;
      }
    });
  }

  void onNext() {
    setState(() {
      if (index >= 0 && index < gateaux.length - 1) {
        index++;
      }
    });
  }

  void onOrder() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.cake, size: 50, color: Colors.brown.shade800),
        title: Text(widget.title),
      ),
      body: Column(children: [
        Carte(
          gateaux.elementAt(index)['ref'].toString(),
          'images/' + gateaux.elementAt(index)['photo'].toString(),
          gateaux.elementAt(index)['titre'].toString(),
          gateaux.elementAt(index)['description'].toString(),
          gateaux.elementAt(index)['prix'].toString(),
        ),
        Container(
            child: Text(
          'Ingrédients :',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 37, 5, 142)),
        )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                ...(gateaux.elementAt(index)['ingredients'] as List<String>)
                    .map((unIngredient) {return
                  Text(
                    unIngredient,
                    style: TextStyle(
                        fontSize: 13),
                  );
                })
              ],
            )),
        Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            width: double.infinity,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: onOrder,
                child: Text(
                  'Commandez',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: onPreviews, child: Text('<< Précédent')),
            ElevatedButton(onPressed: onNext, child: Text('Suivant >>')),
          ],
        ),
      ]),
    );
  }
}
