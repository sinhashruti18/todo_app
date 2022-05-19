import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/list_model.dart';
import 'package:todo_app/provider/provider.dart';
import 'package:todo_app/widget/textfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  Future showtaskDialog(BuildContext context) async {
    String sampleText = '';
    showDialog<String>(
        context: context,
        builder: (context) {
          return Consumer<MyProvider>(
            builder: (context, value, child) => AlertDialog(
              actions: [
                Container(
                    margin: EdgeInsets.all(4),
                    child: MyTextField(
                      Controller: _controller,
                      hintText: "Task",
                    )),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      final tasklist = ListModel(_controller.text);
                      value.addTask(tasklist);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.red),
                        child: Center(child: Text("ADD"))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<MyProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TODO App")),
      ),
      body: Column(children: [
        Expanded(
          child: Consumer<MyProvider>(
            builder: (context, value, child) => Container(
                child: ListView.builder(
              itemCount: value.taskList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text('${value.taskList[index].task}'),
                      trailing: Wrap(
                        spacing: 12,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final String newTask =
                                  await showtaskDialog(context);
                              setState(() {
                                value.taskList[index].task = newTask;
                              });
                            },
                            child: Icon(Icons.edit),
                          ),
                          GestureDetector(
                              onTap: () {
                                value.deleteTask(value.taskList[index]);
                              },
                              child: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showtaskDialog(context);
        },
      ),
    );
  }
}
