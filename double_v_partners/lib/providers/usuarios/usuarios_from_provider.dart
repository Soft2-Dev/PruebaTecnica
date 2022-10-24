import 'package:flutter/cupertino.dart';

class UsuariosFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  String id = '';
  String documento = '';
  String nombre = '';
  String apellido = '';
  String ciudad = '';
  String barrio = '';
  String direccion = '';
  String fecha = '';
  bool selectFecha = false;
}
