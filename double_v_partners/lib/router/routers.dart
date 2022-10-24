import 'package:flutter/material.dart';

import '../api/construcion_page.dart';
import '../api/splash_auth_layout.dart';
import '../pages/detalle_usuario.dart';
import '../pages/direcciones.dart';
import '../pages/nueva_direccion.dart';
import '../pages/nuevo_usuario.dart';
import '../pages/usuarios_pages.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    //NuevoUsuario
    'splas': (BuildContext context) => SplashScreenPage(),
    'NuevoUsuario': (BuildContext context) => NuevoUsuario(),
    'UsuariosPages': (BuildContext context) => UsuariosPages(),
    'NuevaDireccion': (BuildContext context) => NuevaDireccion(),
    'DetalleUsuario': (BuildContext context) => DetalleUsuario(),
    'DireccionesPages': (BuildContext context) => DireccionesPages(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
