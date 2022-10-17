import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:album_app/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../repository/stickers/stickers_repository.dart';
import '../../repository/stickers/stickers_repository_impl.dart';
import 'my_stickers_page.dart';

class MyStickerRoute extends FlutterGetItPageRoute {
  const MyStickerRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<MyStickersPresenter>(
            (i) => MyStickersPresenterImpl(stickersRepository: i())),
      ];

  @override
  WidgetBuilder get page =>
      (context) => MyStickersPage(presenter: context.get());
}
