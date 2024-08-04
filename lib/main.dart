import 'package:flutter/material.dart';
import 'allget_api/getlearn_api.dart';
import 'allget_api/itemsGet_api.dart';
import 'allget_api/patchget_api.dart';
import 'allget_api/post_api.dart';
import 'allget_api/put_api.dart';
import 'allget_api/putget_api.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',

      home:  HomePatchGetApi(),
    );
  }
}

