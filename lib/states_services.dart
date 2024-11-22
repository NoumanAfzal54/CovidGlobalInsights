import 'dart:convert';
import 'Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import 'Models/WorldStatesModel.dart';

class stateservices {
  List<WorldStatesModel> stateslist = [];
  Future<WorldStatesModel> fetchworldstatesrecord() async {
    // final response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    //Alternate way of above procedure
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}




