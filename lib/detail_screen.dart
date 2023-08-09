import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int data;

  const DetailPage(this.data, {super.key});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailView(data: widget.data),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.data});

  final int data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data.toString(), style: const TextStyle(fontSize: 36.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
