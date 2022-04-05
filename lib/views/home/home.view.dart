import 'package:core/locator.dart';
import 'package:core/services/api.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends HookWidget {
  final api = dependency<ApiService>().get('12345');
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dependency<ApiService>().get('12345');
    //throw Exception('Not implemented');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Botao")),
          TextField(),
          Chip(label: Text("Joaozera")),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
