import 'dart:developer';

import 'package:album_app/app/core/ui/helpers/loader.dart';
import 'package:album_app/app/models/register_user_model.dart';
import 'package:album_app/app/pages/auth/login/login_page.dart';
import 'package:album_app/app/pages/auth/login/view/login_view.dart';
import 'package:album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:album_app/app/pages/auth/register/view/register_view.dart';
import 'package:album_app/app/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/ui/helpers/messages.dart';

abstract class LoginViewImpl extends State<LoginPage> with Messages<LoginPage>, Loader<LoginPage> implements LoginView {

  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void success() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

}
