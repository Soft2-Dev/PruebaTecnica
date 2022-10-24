import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../buttons/customOuntlined.dart';
import '../providers/usuarios/usuarios_from_provider.dart';
import '../providers/usuarios/usuarios_provider.dart';

class NuevaDireccion extends StatelessWidget {
  const NuevaDireccion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fromProvider = Provider.of<UsuariosFromProvider>(context);
    final provider = Provider.of<UsuariosProvider>(context);
    print(provider.id);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff082452),
        title: Text('Nueva Dirección ${fromProvider.nombre}'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
          width: size.height * 0.1,
          height: size.height * 0.1,
          margin: EdgeInsets.only(top: size.height * 0.01),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: SizedBox(
                width: size.height * 0.4,
                height: size.height * 0.4,
                child: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 40,
                )),
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Ciudad(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.03,
        ),
        Direccion(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.03,
        ),
        Barrio(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.03,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        _BotonGuardar(
            provider: provider, fromProvider: fromProvider, size: size)
      ]),
    ));
  }
}

class _BotonGuardar extends StatelessWidget {
  const _BotonGuardar({
    Key? key,
    required this.provider,
    required this.fromProvider,
    required this.size,
  }) : super(key: key);

  final UsuariosProvider provider;
  final UsuariosFromProvider fromProvider;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final rpta = await provider.setDireccion(fromProvider);
        if (rpta) {
          _modalNuevaDireccion(context);
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        width: size.width * 0.25,
        height: size.height * 0.06,
        decoration: BoxDecoration(
            color: const Color(0xff082452),
            borderRadius: BorderRadius.circular(10)),
        child: const Text(
          'Guardar',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  _modalNuevaDireccion(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
              padding: const EdgeInsets.only(top: 10),
              height: size.height * 0.15,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿Desea Crear una Nueva Dirección?',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            left: size.width * 0.01, right: size.width * 0.02),
                        child: OuntlinedButton(
                            textColor: const Color(0xff006414),
                            color: const Color(0xff006414),
                            onPressed: () {
                              return true;
                            },
                            text: 'Si'),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            left: size.width * 0.02, right: size.width * 0.01),
                        child: OuntlinedButton(
                            textColor: const Color(0xffbd0003),
                            color: const Color(0xffbd0003),
                            onPressed: () {
                              Navigator.pop(context);
                              return false;
                            },
                            text: 'No'),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}

class Ciudad extends StatelessWidget {
  const Ciudad({Key? key, required this.size, required this.fromProvider})
      : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.location_city,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.ciudad = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Ciudad',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Direccion extends StatelessWidget {
  const Direccion({Key? key, required this.size, required this.fromProvider})
      : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.map,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.direccion = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Dirección',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Barrio extends StatelessWidget {
  const Barrio({Key? key, required this.size, required this.fromProvider})
      : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.person_pin,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.barrio = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Barrio',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
