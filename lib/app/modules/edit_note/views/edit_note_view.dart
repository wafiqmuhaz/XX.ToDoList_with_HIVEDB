// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/db/database.dart';

import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  Notes note = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.titleC.text = note.title!;
    controller.descC.text = note.desc!;
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT ITEM'),
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
                    await controller.editNote(note);
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
