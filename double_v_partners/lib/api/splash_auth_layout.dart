import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../pages/usuarios_pages.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: UsuariosPages(),
      // backgroundColor: Color(0xffc330d1),
      duration: 5000,
      imageSize: 130,
      imageSrc: "img/icono.png",
      text: "Registro Usuarios",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
