import 'package:dio/dio.dart';

import '../models/show.dart';

class ShowRepository {
  Dio? dio;
  final url = "https://agendashows.azurewebsites.net/v1/show";

  ShowRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<Show>> fetchShow() async {
    final response = await dio!.get(url);
    final showResponse = response.data as List;

    return showResponse.map((json) => Show.fromJson(json)).toList();
  }
}
