import 'package:chat_ui/home.dart';
import 'package:chat_ui/chat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": ((context) => Home()),
      "/chat": ((context) => Chat()),
    },
  ));
}
