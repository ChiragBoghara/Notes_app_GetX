import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  var date = 0.obs;
  var month = "".obs;
  var day = "".obs;

  Stream<QuerySnapshot> notesStream;

  insertNote(String note) {
    FirebaseFirestore.instance.collection('notes').add({
      'completed': false,
      'text': note,
    });
    Get.back();
    Get.snackbar(
      "Inserted Successfully",
      "✔",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(15.0),
    );
  }

  toggleTask(var ref, bool completed) {
    ref.update({
      'completed': !completed,
    });
  }

  deleteNote(var ref) {
    ref.delete();
    Get.snackbar(
      "Note Deleted Successfully",
      "✔",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15.0),
    );
  }

  updateNote(var ref, String data) {
    ref.update({
      'text': data,
    });
    Get.back();
    Get.snackbar(
      "Note Updated Successfully",
      "✔",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.lightGreen,
      margin: EdgeInsets.all(15.0),
    );
  }

  @override
  void onInit() {
    notesStream = FirebaseFirestore.instance.collection('notes').snapshots();
    var d = DateTime.now();
    date.value = d.day;
    switch (d.weekday) {
      case 0:
        day.value = "Sunday";
        break;
      case 1:
        day.value = "Monday";
        break;
      case 2:
        day.value = "Tuesday";
        break;
      case 3:
        day.value = "Wednesday";
        break;
      case 4:
        day.value = "Thursday";
        break;
      case 5:
        day.value = "Friday";
        break;
      case 6:
        day.value = "Saturday";
        break;
    }

    switch (d.month) {
      case 0:
        month.value = "January";
        break;
      case 1:
        month.value = "February";
        break;
      case 2:
        month.value = "March";
        break;
      case 3:
        month.value = "April";
        break;
      case 4:
        month.value = "May";
        break;
      case 5:
        month.value = "June";
        break;
      case 6:
        month.value = "July";
        break;
      case 7:
        month.value = "August";
        break;
      case 8:
        month.value = "September";
        break;
      case 9:
        month.value = "October";
        break;
      case 10:
        month.value = "November";
        break;
      case 11:
        month.value = "December";
        break;
    }

    super.onInit();
  }
}
