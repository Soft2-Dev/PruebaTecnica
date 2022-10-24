class Direcciones {
  List<Direccion> dato = [];
  Direcciones();

  Direcciones.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Direccion.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $result["rp"] ='ok';
// $result["id"] =$registro['id'];
// $result["ciudad"] =$registro['ciudad'];
// $result["direccion"] =$registro['direccion'];
// $result["barrio"] =$registro['barrio'];
// $result["idPersona"] =$registro['idPersona'];

class Direccion {
  String? rp;
  String? id;
  String? ciudad;
  String? direccion;
  String? barrio;
  String? idPersona;

  Direccion({
    this.rp,
    this.id,
    this.ciudad,
    this.direccion,
    this.barrio,
    this.idPersona,
  });

  Direccion.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    ciudad = datos['ciudad'];
    direccion = datos['direccion'];
    barrio = datos['barrio'];
    idPersona = datos['idPersona'];
  }
}
