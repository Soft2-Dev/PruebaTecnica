import 'package:double_v_partners/providers/usuarios/usuarios_from_provider.dart';
import 'package:double_v_partners/providers/usuarios/usuarios_provider.dart';
import 'package:double_v_partners/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/AllApi.dart';
import 'api/construcion_page.dart';
import 'api/notificationService.dart';
import 'api/splash_auth_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuariosProvider()),
        ChangeNotifierProvider(create: (_) => UsuariosFromProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registros',
      home: const SplashScreenPage(),
      initialRoute: 'splas',
      routes: getRutas(),
      scaffoldMessengerKey: NotificationService.msnKey,

      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => Construccion());
      },

      // theme: ThemeData.light()
      //     .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
