class Model {
  int id;
  String name;

  Model({this.id, this.name});
  factory Model.convertModel(Map<String, dynamic> object) {
    return Model(id: object['id'], name: object['name']);
  }

  static Future<List<Model>> listUnitMedicine() async {
    List<String> _listUnit = ["mg/kg", "μg/kg", "gram/kg"];
    List<Model> list = new List<Model>();

    for (int a = 0; a < _listUnit.length; a++) {
      Model models = new Model();
      models.id = a+1;
      models.name = _listUnit[a];
      list.add(models);
    }

    return list;
  }
}
