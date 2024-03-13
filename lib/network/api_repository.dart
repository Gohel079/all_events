


import 'package:dio/dio.dart';
import 'package:event_book_task/model/music_response_model.dart';
import 'api.dart';

class ApiRepository {

  API api = API();


  Future<CommonResponseModel> getMusicList() async {

    try {
      Response response = await api.sendRequest.get("/music.json");

      if (response.statusCode == 200) {
        print("CALLED SUCCESSFULLY");

        CommonResponseModel popularMovieListResponse = CommonResponseModel.fromJson(response.data);
        print("DAAAAAT ${popularMovieListResponse}");
        return popularMovieListResponse;


      } else {
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("ERROR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }

  }


  Future<CommonResponseModel> getBusinessList() async {

    try {
      Response response = await api.sendRequest.get("/business.json");

      if (response.statusCode == 200) {
        print("CALLED SUCCESSFULLY");

        CommonResponseModel popularMovieListResponse = CommonResponseModel.fromJson(response.data);
        print("DAAAAAT ${popularMovieListResponse}");
        return popularMovieListResponse;


      } else {
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("ERROR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }

  }

  Future<CommonResponseModel> getSportsList() async {

    try {
      Response response = await api.sendRequest.get("/sports.json");

      if (response.statusCode == 200) {
        print("CALLED SUCCESSFULLY");

        CommonResponseModel popularMovieListResponse = CommonResponseModel.fromJson(response.data);
        print("DAAAAAT ${popularMovieListResponse}");
        return popularMovieListResponse;


      } else {
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("ERROR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }

  }

  Future<CommonResponseModel> getWorkShopList() async {

    try {
      Response response = await api.sendRequest.get("/workshops.json");

      if (response.statusCode == 200) {
        print("CALLED SUCCESSFULLY");

        CommonResponseModel popularMovieListResponse = CommonResponseModel.fromJson(response.data);
        print("DAAAAAT ${popularMovieListResponse}");
        return popularMovieListResponse;


      } else {
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("ERROR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }

  }

  Future<CommonResponseModel> getAllList() async {

    try {
      Response response = await api.sendRequest.get("/all.json");

      if (response.statusCode == 200) {
        print("CALLED SUCCESSFULLY");

        CommonResponseModel popularMovieListResponse = CommonResponseModel.fromJson(response.data);
        return popularMovieListResponse;


      } else {
        throw Exception('Unexpected response data type: ${response.data.runtimeType}');
      }
    }
    catch (ex) {
      print("ERROR : ${ex.toString()}");
      throw Exception('Unexpected response data type: ${ex.toString()}');
    }

  }

}
