// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/db/database.dart';

class AddNoteController extends GetxController {
  RxBool isLoad = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  Future<void> addNote() async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      //MEMBUAT TANPA ID
      Notes note = Notes()
        ..title = titleC.text
        ..desc = descC.text;

      final box = NManager.getAllNotes();

      // DAPAT ID AUTO INC
      int id = await box.add(note);
      note.id = id;

      note.save();

      // ini untuk memasukkan data dengan key yang bebas
      // await box.put('bebas & unique', note);

      // print("ID = $id");
      // print("BERHASIL MENAMBAH DATA KE DB LOCAL STORAGE DENGAN HIVE");

      // print(
      //   box.toMap()[id]!.id,
      // );
      // print(
      //   box.toMap()[id]!.title,
      // );
      // print(
      //   box.toMap()[id]!.desc,
      // );
    }
  }
}
