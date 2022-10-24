import 'package:double_v_partners/providers/usuarios/usuarios_provider.dart';
import 'package:double_v_partners/usuarios/clientes/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuarios/usuarios_from_provider.dart';

class DetalleUsuario extends StatelessWidget {
  const DetalleUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<UsuariosProvider>(context).isSelectUsuario;
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff082452),
              title: Text('Detalle ${usuario.nombre}'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Container(
                  width: size.height * 0.15,
                  height: size.height * 0.15,
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: SizedBox(
                        width: size.height * 0.4,
                        height: size.height * 0.4,
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 40,
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                _Datos(
                    size: size,
                    etiqueta: 'Documento',
                    dato: usuario.documento!),
                SizedBox(
                  height: size.height * 0.05,
                ),
                _Datos(size: size, etiqueta: 'Nombre', dato: usuario.nombre!),
                SizedBox(
                  height: size.height * 0.05,
                ),
                _Datos(
                    size: size, etiqueta: 'Apellido', dato: usuario.apellidos!),
                SizedBox(
                  height: size.height * 0.05,
                ),
                _Datos(
                    size: size,
                    etiqueta: 'F. Nacimiento',
                    dato: usuario.fechaNacimiento!),
                SizedBox(
                  height: size.height * 0.08,
                ),
                _BotonGuardar(size: size)
              ],
            )));
  }
}

class _BotonGuardar extends StatelessWidget {
  const _BotonGuardar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {      
        
        Navigator.pushNamed(context, 'DireccionesPages');
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        width: size.width * 0.25,
        height: size.height * 0.06,
        decoration: BoxDecoration(
            color: const Color(0xff082452),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Ver Direcciones',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Expanded(child: SizedBox()),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class _Datos extends StatelessWidget {
  const _Datos({
    Key? key,
    required this.size,
    required this.etiqueta,
    required this.dato,
  }) : super(key: key);

  final Size size;
  final String etiqueta;
  final String dato;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Row(children: [
        SizedBox(
          width: size.width * 0.35,
          child: Text(
            '$etiqueta: ',
            style: const TextStyle(
                color: Color(0xff082452),
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
        ),
        Text(
          dato,
          style: const TextStyle(fontSize: 17),
        )
      ]),
    );
  }
}
