import 'dart:developer';

import 'package:album_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:album_app/app/models/register_user_model.dart';
import 'package:album_app/app/pages/auth/login/view/login_view.dart';
import 'package:album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:album_app/app/pages/auth/register/view/register_view.dart';
import 'package:album_app/app/repository/auth/auth_repository.dart';
import 'package:album_app/app/services/login/login_service.dart';

import 'login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;
  late final LoginView _view;

  LoginPresenterImpl({required this.loginService});

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException {
      _view.error('Usuário ou senha inválidos');
    } catch (e,s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _view.error('Erro ao realizar login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
