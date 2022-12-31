import 'package:get/get.dart';
import 'package:laundry_management_system/data/model/laundry.dart';

class CSearch extends GetxController {
  final _data = Laundry().obs;
  Laundry get data => _data.value;
  set data(newData) {
    _data.value = newData;
  }
}
