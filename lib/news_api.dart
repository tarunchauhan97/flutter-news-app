import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model.dart';

Future<List<NewsApiModel>> getNews() async {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=f9a1445c523b4aa88f383f6dc0fc408e";
  Response res = await get(Uri.parse(endPointUrl));
  Map<String, dynamic> json = jsonDecode(res.body);
  List<dynamic> body = json['articles'];
  print('----------------------------------');

  Uri uri = Uri.parse(endPointUrl);

  //final response = await get(uri);

  // if (response.statusCode == 200 || response.statusCode == 201) {
  //   Map<String, dynamic> map = json.jsonDecode(response.body);

  // List _articlesList = map['articles'];

  List<NewsApiModel> newsList = body.map((jsonData) => NewsApiModel.fromJson(jsonData)).toList();

  print("_articlesList${body}");

  return newsList;
  // } else {
  //   print("error");
  //   return [];
  // }
}
