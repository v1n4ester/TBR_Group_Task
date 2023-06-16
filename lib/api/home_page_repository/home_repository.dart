import 'package:dio/dio.dart';
import 'package:tbr_group_task/api/home_page_repository/models/missions.dart';

class HomeRepository {
  final _dio = Dio();
  final _url = "https://api.spacexdata.com/v3/missions/";

  HomeRepository();

  Future<Missions> receiveMission({
    required String missionId,
  }) async {
    final response = await _dio.get("$_url$missionId");
    final mission = Missions.fromJson(response.data);
    return mission;
  }
}