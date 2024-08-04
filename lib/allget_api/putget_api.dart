import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:learn_allapi/allmodels/putget_model.dart';

class HomePutGetApi extends StatefulWidget {
  const HomePutGetApi({super.key});

  @override
  State<HomePutGetApi> createState() => _HomePutGetApiState();
}

class _HomePutGetApiState extends State<HomePutGetApi> {
  Future<PutMode?> putGetData()async{
    var url  =  Uri.parse("https://reqres.in/api/users/2");
    var response = await http.get(url);
    if(response.statusCode==200){
      var used = jsonDecode(response.body);
      var user = PutMode.fromJson(used);
      return user ;



    }
    else{
      print("failed to get data ");
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: FutureBuilder(future: putGetData(), builder: (context, snapshot) {
        if(snapshot.hasData){
      var user = snapshot.data!.data;
         return Center(
           child: Column(
             children: [
               Text("${user!.id}"),
               Text("${user!.email}"),
               Text("${user!.firstName}"),
               Text("${user!.lastName}"),
               Text("${user!.avatar}"),
             ],
           ),
         );

        }
        else{
          return  Center(child: CircularProgressIndicator(),);
        }
      },),),
    );
  }
}
