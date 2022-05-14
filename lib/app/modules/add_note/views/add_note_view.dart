// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAMBAH NOTE'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleC,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "item",
                hintText: "Masukkan item anda!",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.descC,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "deskripsi",
                hintText: "Masukkan deskripsi anda!",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => ElevatedButton(
                onPressed: () async {
                  if (controller.isLoad.isFalse) {
                    await controller.addNote();
                    Get.back();
                  }
                },
                child: Text(
                  controller.isLoad.isFalse ? "Tambah Data" : "Loading...",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
