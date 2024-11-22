import 'package:escobar/world_screen.dart';
import 'package:flutter/material.dart';

class detail_screen extends StatefulWidget {
  String title, imageurl;
  int totalcases, totalDeaths, totalRecovered, active, critical, test;
  detail_screen(
      {required this.title,
      required this.imageurl,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.test,
      required this.totalcases});

  @override
  State<detail_screen> createState() => _detail_screenState();
}
final TextStyle color1 = TextStyle(color: Colors.white);

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title,style: color1,),
            backgroundColor: Colors.grey.shade900,
            centerTitle: true,

          ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 40),
                   child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ReusableRow(
                              title: "Total Deaths",
                              value: widget.totalDeaths.toString()),
                          ReusableRow(
                              title: "Total Recovered",
                              value: widget.totalRecovered.toString()),
                          ReusableRow(
                              title: "Active",
                              value: widget.active.toString()),
                          ReusableRow(
                              title: "Critical",
                              value: widget.critical.toString()),
                          ReusableRow(
                              title: "Total Recovered",
                              value: widget.test.toString()),
                          ReusableRow(
                              title: "Total Cases",
                              value: widget.totalcases.toString()),

                        ],
                      ),
                    ),
                 ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.imageurl),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class Resuablerow extends StatelessWidget {
  String title, content;
  Resuablerow({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [Text(title), Text(content,style: color1,)],
      );
  }
}
