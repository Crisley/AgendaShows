import 'package:dio/dio.dart';

import '../models/show.dart';

class ShowRepository {
  Dio? dio;
  final url = "https://agendashows.azurewebsites.net/v1";
  //final url = "https://localhost:7209/v1";

  ShowRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<Show>> fetchShow() async {
    final response = await dio!.get('$url/show');
    final showResponse = response.data as List;

    return showResponse.map((json) => Show.fromJson(json)).toList();
  }

  Future<List<Show>> fetchShowHistorico() async {
    final response = await dio!.get('$url/show/historico');
    final showResponse = response.data as List;

    return showResponse.map((json) => Show.fromJson(json)).toList();
  }
}
