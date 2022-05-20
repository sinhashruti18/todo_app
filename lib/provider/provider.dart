import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/list_model.dart';

class MyProvider extends ChangeNotifier {
  List<ListModel> taskList = [];
  void addTask(ListModel listModel) {
    taskList.add(listModel);
    notifyListeners();
  }

  void deleteTask(ListModel listModel) {
    taskList.remove(listModel);
    notifyListeners();
  }

  void editTask(ListModel listModel, int index) {
    taskList.insert(index, listModel);
    notifyListeners();
  }

  void edit(String newText, int index) {
    taskList[index].task = newText;
    notifyListeners();
  }
}
