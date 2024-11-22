import 'dart:convert';
import 'package:escobar/Models/Countries_Model.dart';

import 'Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import 'Models/WorldStatesModel.dart';

class countriesservices {
  List<CountriesModel> countrieslist = [];
  Future<List<CountriesModel>> CountriesstatesApi() async {
    // final response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    //Alternate way of above procedure
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (Map i in data) {
        countrieslist.add(CountriesModel.fromJson(i));
      }
      return countrieslist;
    } else {
      throw Exception('Error');
    }
  }
}
