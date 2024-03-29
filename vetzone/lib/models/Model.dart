class Model {
  int id;
  String name;

  Model({required this.id, required this.name});
  factory Model.convertModel(Map<String, dynamic> object) {
    return Model(id: object['id'], name: object['name']);
  }

  static Future<List<Model>> listUnitMedicine() async {
    List<String> _listUnit = ["mg/kg", "μg/kg", "gram/kg"];
    List<Model> list = <Model>[];

    for (int a = 0; a < _listUnit.length; a++) {
      list.add(Model(id: a + 1, name: _listUnit[a]));
    }

    return list;
  }

  static Future<List<Model>> listTypePets() async {
    List<String> _listType = [
      "Anjing",
      "Kucing",
      "Musang",
      "Hamster",
      "Kelinci"
    ];
    List<Model> list = <Model>[];

    for (int a = 0; a < _listType.length; a++) {
      list.add(Model(id: a + 1, name: _listType[a]));
    }

    return list;
  }

  static Future<List<Model>> listLiquidUnit() async {
    List<String> _listUnit = ["ml", "liter", "cc", "dl"];
    List<Model> list = <Model>[];

    for (int a = 0; a < _listUnit.length; a++) {
      list.add(Model(id: a + 1, name: _listUnit[a]));
    }

    return list;
  }

  static Future<List<Model>> listMassaUnit() async {
    List<String> _listUnit = ["kg", "gram", "mg", "µg", "lb"];
    List<Model> list = <Model>[];

    for (int a = 0; a < _listUnit.length; a++) {
      list.add(Model(id: a + 1, name: _listUnit[a]));
    }

    return list;
  }

  static Future<List<Model>> listTempUnit() async {
    List<String> _listUnit = ["Celsius", "Reahmur", "Fahrenheit"];
    List<Model> list = <Model>[];

    for (int a = 0; a < _listUnit.length; a++) {
      list.add(Model(id: a + 1, name: _listUnit[a]));
    }

    return list;
  }
}
