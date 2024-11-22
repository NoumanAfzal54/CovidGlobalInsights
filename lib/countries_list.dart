import 'package:escobar/Models/Countries_Model.dart';
import 'package:escobar/countries_services.dart';
import 'package:escobar/detail_screen.dart';
import 'package:escobar/states_services.dart';
import 'package:flutter/material.dart';

class countrieslist extends StatefulWidget {
  const countrieslist({super.key});

  @override
  State<countrieslist> createState() => _countrieslistState();
}

class _countrieslistState extends State<countrieslist> {
  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    countriesservices c1 = countriesservices();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: searchcontroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Search by name",
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black26),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: c1.CountriesstatesApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading...');
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: c1.countrieslist.length,
                          itemBuilder: (context, index) {
                            String? name = snapshot.data![index].country;

                            if (searchcontroller.text.isEmpty) {
                              return Column(
                                children: [
                                  ReusableRow(
                                      imageUrl: snapshot
                                          .data![index].countryInfo!.flag
                                          .toString(),
                                      subtitle: snapshot.data![index].deaths
                                          .toString(),
                                      title: snapshot.data![index].country
                                          .toString(),
                                      totalDeaths: snapshot
                                          .data![index].todayDeaths!
                                          .toInt(),
                                      totalRecovered: snapshot
                                          .data![index].todayRecovered!
                                          .toInt(),
                                      active:
                                          snapshot.data![index].active!.toInt(),
                                      critical: snapshot.data![index].critical!
                                          .toInt(),
                                      test:
                                          snapshot.data![index].tests!.toInt(),
                                      totalcases:
                                          snapshot.data![index].cases!.toInt()),
                                  SizedBox(
                                    height: 3,
                                  )
                                ],
                              );
                            } else if (name!.toLowerCase().contains(
                                searchcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  ReusableRow(
                                      imageUrl: snapshot
                                          .data![index].countryInfo!.flag
                                          .toString(),
                                      subtitle: snapshot.data![index].deaths
                                          .toString(),
                                      title: snapshot.data![index].country
                                          .toString(),
                                      totalDeaths: snapshot
                                          .data![index].todayDeaths!
                                          .toInt(),
                                      totalRecovered: snapshot
                                          .data![index].todayRecovered!
                                          .toInt(),
                                      active:
                                          snapshot.data![index].active!.toInt(),
                                      critical: snapshot.data![index].critical!
                                          .toInt(),
                                      test:
                                          snapshot.data![index].tests!.toInt(),
                                      totalcases:
                                          snapshot.data![index].cases!.toInt()),
                                  SizedBox(
                                    height: 3,
                                  )
                                ],
                              );
                            }
                            //When we will search well get desired search and the other will you can say hide
                            else {
                              return Container();
                            }
                          }),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String imageUrl, title, subtitle;
  int totalcases, totalDeaths, totalRecovered, active, critical, test;

  ReusableRow(
      {required this.imageUrl,
      required this.subtitle,
      required this.title,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.test,
      required this.totalcases}); // by using required keyword we are making mandatory for the user to provide arguments

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => detail_screen(
                      title: title,
                      imageurl: imageUrl,
                      totalDeaths: totalDeaths,
                      totalRecovered: totalRecovered,
                      active: active,
                      critical: critical,
                      test: test,
                      totalcases: totalcases)));
        },
        child: ListTile(
          leading: Container(
            height: 30,
            width: 60,
            child: Image(
              image: NetworkImage(imageUrl),
            ),
          ),
          title: Text(title, style: TextStyle(color: Colors.white)),
          subtitle: Row(
            children: [Text('Total cases:'), Text(subtitle)],
          ),
        ));
  }
}
