import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_keeper_getx/controllers/note_controller.dart';

class CreateNoteScreen extends StatelessWidget {
  final noteController = Get.find<NoteController>();
  final noteFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Create Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                maxLength: 40,
                cursorColor: Colors.green,
                controller: noteFieldController,
                decoration: InputDecoration(
                  hintText: "Write a Note",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Cancel"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 25.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      noteController.insertNote(noteFieldController.text);
                    },
                    child: Text("Create"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 25.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
