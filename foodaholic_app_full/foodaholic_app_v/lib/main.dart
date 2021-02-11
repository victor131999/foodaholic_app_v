import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/pages/home_page.dart';
//import 'package:foodaholic_app_v/pages/login_page.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodaholic_app_v/providers/content_provider.dart';
import 'package:foodaholic_app_v/utils/preferences.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ContentProvider>(
      create: (_) => ContentProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final prefs = new Preferences();

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return ChangeNotifierProvider<ContentProvider>(
        create: (BuildContext context) => ContentProvider(),
        child: Consumer<ContentProvider>(builder: (context, provider, __) {
          provider.initDarkMode(prefs.mode);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fooda holic',
            theme: ThemeMain.setup(provider.darkMode),
            home: FutureBuilder(
                future: _initialization,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container(
                      child: Center(
                        child: Text("Error al iniciar",
                            style: Theme.of(context).textTheme.headline3),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    print('Firebase iniciado correctamente!');
                    return HomePage();
                  }

                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                }),
          );
        }));
  }
}
