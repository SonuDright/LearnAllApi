import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:learn_allapi/allmodels/itemsgetmodel.dart';

class HomeItemsgetApi extends StatefulWidget {
  const HomeItemsgetApi({super.key});

  @override
  State<HomeItemsgetApi> createState() => _HomeItemsgetApiState();
}

class _HomeItemsgetApiState extends State<HomeItemsgetApi> {

  Future<ItemtMode> getItem()async{
    var url = Uri.parse("https://reqres.in/api/users");
    var response = await http.get(url);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      var user = ItemtMode.fromJson(data);
      return user;
    }
    else{
      return ItemtMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:FutureBuilder(future: getItem(), builder: (context, snapshot) {
          if(snapshot.hasData){
            var used = snapshot.data!.data;
            return ListView.builder(
              itemCount: used!.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      Text("${used[index].id}"),
                      Text("${used[index].email}"),
                      Text("${used[index].firstName}"),
                      Text("${used[index].lastName}"),
                      Text("${used[index].avatar}"),
                    ],
                  ),
                );

            },);
          }
          else{
            return Center(child:CircularProgressIndicator() ,);
          }
        },) ,
      ),
    
    );
  }
}
