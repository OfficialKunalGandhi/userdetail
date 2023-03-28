import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:userdetail/models/usersModel.dart';
import 'package:userdetail/server/apiPath.dart';

class ApiClient {
  Dio dio = Dio();

  ApiClient() {
    dio.interceptors..add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<List<UsersModel>> getUsers() async {
    List<UsersModel> usersModel = [];

    try {
      Response response = await dio.get(ApiPath.user);
      if (response.statusCode == 200) {
        for (var data in response.data) {
          usersModel.add(UsersModel.fromJson(data));
        }
        return usersModel;
      }
      return usersModel;
    } catch (e) {
      debugPrint("Error --" + e.toString());
      return usersModel;
    }
  }
}
