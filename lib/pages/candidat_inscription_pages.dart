import 'package:candidat/common/input.dart';
import 'package:candidat/models/candidat.dart';
import 'package:flutter/material.dart';

import '../common/button.dart';

class candidat_inscription extends StatefulWidget {
  const candidat_inscription({super.key});

  @override
  State<candidat_inscription> createState() => _candidat_inscriptionState();
}

class _candidat_inscriptionState extends State<candidat_inscription> {

  final _formKey = GlobalKey<FormState>();
  final Candidat candidat= Candidat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Inputwidget(
                name: 'Nom',
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  candidat.name=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20,),
              Inputwidget(
                name: 'Prenom',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  candidat.surname=value;

                },

                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20,),
              Inputwidget(
                name: 'Description',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  print("Valeur à sauvegarder $value");
                  candidat.description=value;

                },

                prefixIcon: Icon(Icons.description),
              ),
              SizedBox(height: 20,),

              Inputwidget(
                name: 'Importer une image (url)',

                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  candidat.url=value;

                },

                prefixIcon: Icon(Icons.import_export),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child:  Button(
          onPressed: () {
            if(  _formKey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Inscription Complète'),
                  duration: Duration(seconds: 1),
                ),
              );
              _formKey.currentState!.save();
              Navigator.pop(context, candidat);
            }
          },
          text: "S'inscrire",
        )
      ),
    );
  }
}
