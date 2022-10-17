import 'package:album_app/app/core/config/env/env.dart';
import 'package:album_app/app/fwc_album_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/core/ui/styles/colors_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorsApp.i.primary,
    ),
  );
  await Env.i.load();
  runApp(FwcAlbumApp());
}


