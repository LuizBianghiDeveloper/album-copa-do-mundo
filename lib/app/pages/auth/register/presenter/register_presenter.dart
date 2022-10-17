import 'package:album_app/app/pages/auth/register/view/register_view.dart';

import '../../../../core/mvp/fwc_presenter.dart';

abstract class RegisterPresenter extends FwcPresenter<RegisterView> {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
