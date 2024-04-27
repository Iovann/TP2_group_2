import 'package:candidat/pages/candidat_inscription_pages.dart';
import 'package:flutter/material.dart';
import '../models/candidat.dart';

class presentation extends StatefulWidget {

  presentation({super.key});

  @override
  State<presentation> createState() => _presentationState();
}

class _presentationState extends State<presentation> {
  List<Candidat> candidats = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Hello Samiat',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        actions: [
          Icon(Icons.notifications_on),
      ]
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Column(
                    children: [Text("Candidats", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))],
                  ),
                Column(
                  children: [Text("${candidats.length}")],
                )
              ],
            ),
          ),
          Column(
            children: candidats.map((value) => Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 7, bottom: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: NetworkImage('${value.url}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${value.name}  ${value.surname}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                          Text("${value.description}")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )).toList()
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Candidat candidat = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => candidat_inscription(),
              ));
              setState(() => candidats.add(candidat));
          },
        child: Icon(Icons.add, color: Colors.white,),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ]
      ));}
}
