// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hiveone/app/data/db/database.dart';
import 'package:hiveone/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL NOTES'),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder<Box<Notes>>(
            valueListenable: NManager.getAllNotes().listenable(),
            builder: (context, box, _) {
              List<Notes> allNotes = box.values.toList().cast<Notes>();
              if (allNotes.length == 0) {
                return Center(
                  child: Text("TIDAK ADA DATA"),
                );
              }
              return ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (context, index) {
                  Notes note = allNotes[index];
                  return Card(
                    color: Colors.blue[100],
                    child: ListTile(
                      onTap: () => Get.toNamed(
                        Routes.EDIT_NOTE,
                        arguments: note,
                      ),
                      leading: CircleAvatar(
                        child: Text('${note.id}'),
                      ),
                      title: Text('${note.title}'),
                      subtitle: Text('${note.desc}'),
                      trailing: IconButton(
                        onPressed: () async => await note.delete(),
                        icon: Icon(
                          Icons.delete_forever_outlined,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          Routes.ADD_NOTE,
        ),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
