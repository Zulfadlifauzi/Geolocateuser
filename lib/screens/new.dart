import 'package:flutter/material.dart';

class NewPages extends StatefulWidget {
  const NewPages(String? payload, {Key? key}) : super(key: key);

  @override
  _NewPagesState createState() => _NewPagesState();
}

class _NewPagesState extends State<NewPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Container(
        child: Text('Hello'),
      ),
    );
  }
}
