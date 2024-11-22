import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'countries_services.dart';

class dropdownmenu extends StatefulWidget {
  const dropdownmenu({super.key});

  @override
  State<dropdownmenu> createState() => _dropdownmenuState();
}

class _dropdownmenuState extends State<dropdownmenu> {
  countriesservices cs = countriesservices();
  var selectedvalue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('DropDownMenu'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: cs.CountriesstatesApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return DropdownButton(
                          hint: Text("Select the Flag"),
                          icon: Icon(
                            CupertinoIcons.arrowtriangle_down_fill,
                            color: Colors.white,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedvalue = value;
                            });
                          },
                          items: snapshot.data!.map<DropdownMenuItem>((country) {
                            return DropdownMenuItem(
                              value: country.countryInfo?.id,
                              child: Text(country.tests.toString()),
                            );
                          }).toList(),
                        );
                      },
                    );
                  } else {
                    return Center(child: SpinKitFadingCircle());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
