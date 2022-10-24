// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../api/AllApi.dart';
import '../../api/notificationService.dart';
import '../../usuarios/clientes/direcciones.dart';
import '../../usuarios/clientes/usuarios.dart';
import 'usuarios_from_provider.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];
  List<Direccion> direcciones = [];
  late Usuario isSelectUsuario;
  bool isUsuario = false;
  bool isDireccion = false;
  late String id;

  setUsuarios(UsuariosFromProvider fromProvider, BuildContext context) async {
    final data = {
      'case': '1',
      'documento': fromProvider.documento,
      'nombre': fromProvider.nombre,
      'apellido': fromProvider.apellido,
      'ciudad': fromProvider.ciudad,
      'direccion': fromProvider.direccion,
      'barrio': fromProvider.barrio,
      'fecha': fromProvider.fecha,
    };
    try {
      final json = await AllApi.httpPost('/webservices.php', data);

      final dataMap = jsonDecode(json);
      print(dataMap);

      final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
      if (usuarios.dato[0].rp == 'ok') {
        this.usuarios = usuarios.dato;
        id = usuarios.dato[0].id!;
        final String name = fromProvider.nombre;
        NotificationService.showSnackBarExito('Usuario $name Registrado');
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error en crear Carrera $e');
    }
  }

  setDireccion(UsuariosFromProvider fromProvider) async {
    final data = {
      'case': '2',
      'id': id,
      'ciudad': fromProvider.ciudad,
      'direccion': fromProvider.direccion,
      'barrio': fromProvider.barrio,
    };

    try {
      final json = await AllApi.httpPost('/webservices.php', data);

      final dataMap = jsonDecode(json);
      print(dataMap);
      final Direcciones direcciones = Direcciones.fromlist(dataMap['rpta']);

      if (direcciones.dato[0].rp == 'ok') {
        this.direcciones = direcciones.dato;
        NotificationService.showSnackBarExito('Direccion Agregada');
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error en crear Carrera $e');
    }
  }

  getUsuarios() async {
    String url = '/webservices.php?case=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
    this.usuarios = usuarios.dato;
    if (usuarios.dato[0].rp == 'ok') {
      isUsuario = true;
    }
    notifyListeners();
  }

  getDirecciones() async {
    isDireccion = false;
    String url = '/webservices.php?case=2&id=${isSelectUsuario.id}';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);
    final Direcciones direcciones = Direcciones.fromlist(dataMap['rpta']);
    this.direcciones = direcciones.dato;
    if (direcciones.dato[0].rp == 'ok') {
      isDireccion = true;
    }
    notifyListeners();
  }
}
