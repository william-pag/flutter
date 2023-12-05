import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pag_flutter/screens/screens.dart';
import 'package:pag_flutter/service/app_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  if (kIsWeb) {
    runApp(const MainApp());
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    getApplicationDocumentsDirectory().then((Directory directory) {
      HydratedStorage.build(storageDirectory: directory)
          .then((HydratedStorage storage) {
        HydratedBloc.storage = storage;
        runApp(const MainApp());
      });
    });
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
