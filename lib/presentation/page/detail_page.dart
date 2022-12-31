import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_management_system/config/status.dart';
import 'package:laundry_management_system/presentation/component/detail_laundry.dart';
import '../../data/model/laundry.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.laundry}) : super(key: key);
  final Laundry laundry;

  updateStatus() async {
    final controller = TextEditingController(text: laundry.status);
    var result = await Get.dialog(AlertDialog(
      title: const Text('Update Status'),
      content: DropdownButtonFormField<String>(
        value: controller.text,
        items: Status.listMenu.map((e) {
          return DropdownMenuItem<String>(value: e, child: Text(e));
        }).toList(),
        onChanged: (value) {
          controller.text = value ?? "";
        },
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
        TextButton(
            onPressed: () => Get.back(result: true), child: const Text('OK')),
      ],
    ));
  }

  delete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Laundry'),
          titleSpacing: 0,
          actions: [
            IconButton(
                onPressed: () => updateStatus(), icon: const Icon(Icons.delete))
          ],
        ),
        body: DetailLaundry(laundry: laundry));
  }
}
