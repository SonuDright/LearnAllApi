import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:learn_allapi/allmodels/patchmodel.dart';


class HomePatchGetApi extends StatefulWidget {
  const HomePatchGetApi({super.key});

  @override
  State<HomePatchGetApi> createState() => _HomePatchGetApiState();
}

class _HomePatchGetApiState extends State<HomePatchGetApi> {
  Future<PatchMode?> patchGetData()async{
    var url  =  Uri.parse("https://reqres.in/api/users/2");
    var response = await http.get(url);
    if(response.statusCode==200){
      var used = jsonDecode(response.body);
      var user = PatchMode.fromJson(used);
      return user ;



    }
    else{
      print("failed to get data ");
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: FutureBuilder(future: patchGetData(), builder: (context, snapshot) {
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
