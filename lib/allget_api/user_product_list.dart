import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../allmodels/users_model.dart';

class HomeProductListApi extends StatefulWidget {
  const HomeProductListApi({super.key});

  @override
  State<HomeProductListApi> createState() => _HomeProductListApiState();
}

class _HomeProductListApiState extends State<HomeProductListApi> {

  Future<UsersMode> getProductList()async{
    var url = Uri.parse("https://reqres.in/api/unknown");
    var response = await http.get(url);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      var user = UsersMode.fromJson(data);
      return user;
    }
    else{
      return UsersMode();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(future: getProductList(), builder: (context, snapshot) {
          if(snapshot.hasData){

            var used = snapshot.data?.data;
           return ListView.builder(
              itemCount: used!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text("${used [index].id}"),
                    Text("${used [index].name}"),
                    Text("${used [index].year}"),
                    Text("${used [index].pantoneValue}"),
                    Text("${used [index].color}"),
                  ],
                );
              },);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },) ,
      ),
    );
  }
}
