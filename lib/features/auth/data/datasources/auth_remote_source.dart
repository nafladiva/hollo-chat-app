import 'dart:convert';

import 'package:hollo/core/core.dart';
import 'package:hollo/features/auth/data/models/index.dart';
import 'package:hollo/shared/models/index.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteSource {
  Future<GeneralResponseModel> register(UserRequestModel userData);
  Future<GeneralResponseModel> login(
      {required String username, required String password});
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<GeneralResponseModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await http.post(
        Uri.parse('${Constants.apiBaseUrlProd}/login'),
        body: {
          'username': username,
          'password': password,
        },
      );
      final mapped = json.decode(result.body);
      return GeneralResponseModel.fromMap(mapped);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<GeneralResponseModel> register(UserRequestModel userData) async {
    try {
      final result = await http.post(
        Uri.parse('${Constants.apiBaseUrlProd}/users/register'),
        body: userData.toMap(),
      );
      final mapped = json.decode(result.body);
      return GeneralResponseModel.fromMap(mapped);
    } catch (e) {
      throw Exception();
    }
  }
}
