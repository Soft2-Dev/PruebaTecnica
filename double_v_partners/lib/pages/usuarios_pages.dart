import 'package:double_v_partners/providers/usuarios/usuarios_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuarios/usuarios_from_provider.dart';

class UsuariosPages extends StatefulWidget {
  const UsuariosPages({Key? key}) : super(key: key);

  @override
  State<UsuariosPages> createState() => _UsuariosPagesState();
}

class _UsuariosPagesState extends State<UsuariosPages> {
  @override
  void initState() {
    Provider.of<UsuariosProvider>(context, listen: false).getUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<UsuariosProvider>(context).usuarios;

    final provider = Provider.of<UsuariosProvider>(context);
    List<Widget> itemMap = [];

    if (provider.isUsuario) {
      itemMap = usuarios
          .map((e) => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      onTap: () {
                        provider.isSelectUsuario = e;
                        provider.id = e.id!;
                        Navigator.pushNamed(context, 'DetalleUsuario');
                      },
                      leading: const Icon(Icons.person_outline),
                      title: Text('${e.nombre!}  ${e.apellidos!}'),
                      subtitle: Row(
                        children: [
                          const Text('F. Nacimiento: '),
                          Text(e.fechaNacimiento!),
                        ],
                      ),
                      trailing: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const Divider(
                    height: 3,
                  )
                ],
              ))
          .toList();
    } else {
      itemMap = usuarios
          .map((e) => const Center(child: Text('No Existen Registros')))
          .toList();
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff082452),
        title: const Text('Usuarios'),
        centerTitle: true,
      ),
      body: ListView(
        children: [...itemMap],
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
            backgroundColor: const Color(0xff082452),
            onPressed: () {
              Navigator.pushNamed(context, 'NuevoUsuario');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person_add),
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
