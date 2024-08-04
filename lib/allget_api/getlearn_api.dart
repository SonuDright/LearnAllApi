
import 'dart:convert';

import 'package:flutter/material.dart';

import '../allmodels/getlearn_model.dart';
import 'package:http/http.dart'as http;

class HomeGetLearnApi extends StatefulWidget {
  const HomeGetLearnApi({super.key});

  @override
  State<HomeGetLearnApi> createState() => _HomeGetLearnApiState();
}

class _HomeGetLearnApiState extends State<HomeGetLearnApi> {

  Future<LearngetMode>  getUser() async{

    var url = Uri.parse("https://reqres.in/api/unknown/2");
    var responce = await http.get(url);
    if(responce.statusCode==200){
      var user = jsonDecode(responce.body);
      return LearngetMode.fromJson(user);
    }
    else{
      throw Exception('Failed to load user');

    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           FutureBuilder<LearngetMode>(future: getUser(), builder: (context, snapshot) {
             if(snapshot.hasData){
               var used = snapshot.data?.data;
               return Column(
                 children: [
                   Center(child: Text("${used?.id}")),
                   Center(child: Text("${used?.name}")),
                   Center(child: Text("${used?.year}")),
                   Center(child: Text("${used?.color}")),
                   Center(child: Text("${used?.pantoneValue}")),
                 ],
               );
             }
             else{
               return  Center(child: Text("${snapshot.error}"),);
             }
           },),
          ],
        ),
      ),
    );
  }
}
