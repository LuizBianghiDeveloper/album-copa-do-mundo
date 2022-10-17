import 'package:album_app/app/core/ui/helpers/loader.dart';
import 'package:album_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:album_app/app/pages/splash/splash_page.dart';
import 'package:album_app/app/pages/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPresenterImpl implements SplashPresenter{

  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
   final sp = await SharedPreferences.getInstance();
   final accessToken = sp.getString('acessToken');
    _view.logged(accessToken != null);
  }

  @override
  set view(view) => _view = view;
}