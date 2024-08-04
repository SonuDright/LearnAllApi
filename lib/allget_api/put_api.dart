import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class HomePutApi extends StatefulWidget {
  const HomePutApi({super.key});

  @override
  State<HomePutApi> createState() => _HomePutApiState();
}

class _HomePutApiState extends State<HomePutApi> {

  Future<void> putData()async{
    var url = Uri.parse("https://reqres.in/api/users/2");
    var response = await http.put(url);
    if(response.statusCode==200){
      var used = jsonDecode(response.body);
      print(used);
    }
    else{
      print("Failed to put Data");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        ElevatedButton(onPressed: () {
          putData();
        }, child: Text("PutData")),

      ],),),
    );
  }
}
