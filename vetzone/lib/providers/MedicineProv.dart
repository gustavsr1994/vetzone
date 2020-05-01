import 'package:flutter/cupertino.dart';

class MedicineProv with ChangeNotifier {
  MedicineProv();
  double _medicineDose = 0;

  void setMedicineDose(int mass, int dose, int unit, int concentration) {
    // if(unit == "")
    _medicineDose = 0;
    switch (unit) {
      case 1:
        _medicineDose = (mass * (dose * 1)) / (concentration * 10);
        break;
      case 2:
        _medicineDose = (mass * (dose * 1000)) / (concentration * 10);
        break;
      case 3:
        _medicineDose = (mass * (dose / 1000)) / (concentration * 10);
        break;
    }
    notifyListeners();
  }

  double get getMedicalPaid => _medicineDose;
}
