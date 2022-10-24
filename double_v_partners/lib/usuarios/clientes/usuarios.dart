class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $result["rp"] ='ok';
// $result["id"] =$registro['id'];
// $result["documento"] =$registro['documento'];
// $result["nombres"] =$registro['nombres'];
// $result["apellidos"] =$registro['apellidos'];
// $result["fechaNacimiento"] =$registro['fechaNacimiento'];
// $json['rpta'][]     =$result;

class Usuario {
  String? rp;
  String? id;
  String? documento;
  String? nombre;
  String? apellidos;
  String? fechaNacimiento;

  Usuario({
    this.rp,
    this.id,
    this.documento,
    this.nombre,
    this.apellidos,
    this.fechaNacimiento,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'].toString();
    documento = datos['documento'];
    nombre = datos['nombres'];
    apellidos = datos['apellidos'];
    fechaNacimiento = datos['fechaNacimiento'];
  }
}
