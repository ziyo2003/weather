import 'package:dio/dio.dart';
import 'package:new_api_project/core/exception/exceptions.dart';
import 'package:new_api_project/core/extensioneee/toEntity.dart';
import 'package:new_api_project/features/home/data/model/model.dart';
import 'package:new_api_project/features/home/domain/entity/entity.dart';

abstract class DataSource {
  Future<List<WeatherEntity>> getData();
  factory DataSource() => _DataSource();
}

class _DataSource implements DataSource  {
  final dio = Dio();
  @override
  Future<List<WeatherEntity>> getData() async {
    try {
      final response = await dio.get("http://api.weatherapi.com/v1/current.json?key=e76d154ceb2a4e05a2c62513241901&q=Tashkent&aqi=no");
      print("${response.data}");
      List<dynamic> ls = response.data;
      List<Data> datas = ls.map((value) => Data.fromJson(value)).toList();
      print(datas[0]);
      return datas.map((e) => e.toEntity).toList();
    } catch (e) {
      throw ServerException(errorMassege: "errormassege", errorCode: "errorcode");
    }
  }
}