import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HttpExemple extends StatefulWidget {
  const HttpExemple({super.key});

  @override
  State<HttpExemple> createState() => _HttpExempleState();
}

class _HttpExempleState extends State<HttpExemple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var url = Uri.https('jsonplaceholder.typicode.com', '/posts', {'q': '{http}'});

          // Await the http get response, then decode the json-formatted response.
          var response = await http.get(url);
          if (response.statusCode >= 200 && response.statusCode <= 299){
            var jsonResponse = convert.jsonDecode(response.body) as List <dynamic>;//decodage
            jsonResponse.forEach((element) {
              element = element as Map <String, dynamic>;
              print(element['userId']);
            });
            //var itemCount = jsonResponse['totalItems'];
            //print(response.body);
            print(jsonResponse);
            //print('Number of books about http: $itemCount.');
          } else {
            print('Request failed with status: ${response.statusCode}.');
          }
        },
      ),
    );
  }
}
