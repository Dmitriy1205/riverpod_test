import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_test/app/model/data_model.dart';

class DataRepository {
  final String endpoint =
      'https://api.storyblok.com/v2/cdn/stories/marketfood?version=draft&token=YX1dC80Z9U5IupBCCIbiRgtt&cv=1664543171';

  Future<List<DataModel>> fetchData() async {
    final url = Uri.parse(endpoint);
    final response = await http.get(url);
    final a = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return (a['story']['content']['img'] as List)
          .map((e) => DataModel.fromJson(e))
          .toList();
    } else {
      throw Exception();
    }
  }
}
