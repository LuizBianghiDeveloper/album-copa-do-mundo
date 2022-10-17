import 'dart:developer';

import 'package:album_app/app/repository/auth/user/user_repository.dart';
import 'package:dio/dio.dart';

import '../../../core/exceptions/repository_exception.dart';
import '../../../core/rest/custom_dio.dart';
import '../../../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;
  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get('/api/me');
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar dados do usuário logado', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao buscar dados do usuário logado');
    }
  }
}
