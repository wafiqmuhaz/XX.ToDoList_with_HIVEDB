// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/db/database.dart';

class EditNoteController extends GetxController {
  RxBool isLoad = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  Future<void> editNote(Notes note) async {
    note.title = titleC.text;
    note.desc = descC.text;

    note.save();
  }
}
