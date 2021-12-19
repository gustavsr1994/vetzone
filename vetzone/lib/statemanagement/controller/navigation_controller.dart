import 'package:get/get.dart';
import 'package:vetzone/views/BirthDate.dart';

class NavigationController extends GetxController with StateMixin<String> {
  void changeMenu(String nameMenu) async {
    change(nameMenu, status: RxStatus.success());
  }
}
