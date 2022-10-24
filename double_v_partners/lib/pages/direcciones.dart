import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuarios/usuarios_provider.dart';

class DireccionesPages extends StatefulWidget {
  const DireccionesPages({Key? key}) : super(key: key);

  @override
  State<DireccionesPages> createState() => _DireccionesPagesState();
}

class _DireccionesPagesState extends State<DireccionesPages> {
  @override
  void initState() {
    Provider.of<UsuariosProvider>(context, listen: false).getDirecciones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final direcciones = Provider.of<UsuariosProvider>(context).direcciones;
    final provider = Provider.of<UsuariosProvider>(context);
    List<Widget> itemMap = [];
    if (provider.isDireccion) {
      itemMap = direcciones
          .map((e) => ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('${e.direccion!} - ${e.barrio!}'),
                subtitle: Text(e.ciudad!),
              ))
          .toList();
    } else {
      itemMap = direcciones
          .map((e) => Center(
              child: Container(
                  alignment: Alignment.center,
                  height: 250,
                  width: 150,
                  child: Text('No Existen Registros'))))
          .toList();
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff082452),
        title: const Text('Direcciones'),
        centerTitle: true,
      ),
      body: ListView(children: [...itemMap]),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
            backgroundColor: const Color(0xff082452),
            onPressed: () {
              Navigator.pushNamed(context, 'NuevaDireccion');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add_location_alt),
                Text(
                  'Nuevo',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
      ),
    ));
  }
}
