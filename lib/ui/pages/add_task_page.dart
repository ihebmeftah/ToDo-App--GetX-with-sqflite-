// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task.dart';
import 'package:todo/ui/theme.dart';
import 'package:todo/ui/widgets/button.dart';
import 'package:todo/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _tittleEditingController =
      TextEditingController();
  final TextEditingController _noteEditingController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: Themes().titleStyle,
              ),
              const SizedBox(height: 10),
              inputField(
                  hintText: 'Title', controller: _tittleEditingController),
              const SizedBox(height: 10),
              Text(
                'Note',
                style: Themes().titleStyle,
              ),
              const SizedBox(height: 10),
              inputField(hintText: 'Note', controller: _noteEditingController),
              const SizedBox(height: 10),
              Text(
                'Date',
                style: Themes().titleStyle,
              ),
              const SizedBox(height: 10),
              inputField(
                  readOnly: true,
                  hintText:
                      DateFormat('dd-MM-yyyy').format(_selectedDate).toString(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => getDate(),
                  )),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: Themes().titleStyle,
                        ),
                        const SizedBox(height: 10),
                        inputField(
                            readOnly: true,
                            hintText: _startTime,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.timer),
                              onPressed: () => getTime(isStart: true),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: Themes().titleStyle,
                        ),
                        const SizedBox(height: 10),
                        inputField(
                            readOnly: true,
                            hintText: _endTime,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.timer),
                              onPressed: () => getTime(isStart: false),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Remind',
                style: Themes().titleStyle,
              ),
              const SizedBox(height: 10),
              inputField(
                readOnly: true,
                hintText: '$_selectedRemind Remind Early',
                suffixIcon: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 34,
                    ),
                  ),
                  items: remindList
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem(
                          value: value.toString(),
                          child: Text('$value'),
                        ),
                      )
                      .toList(),
                  style: Themes().subTitleStyle,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRemind = int.parse(value!);
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Repeat',
                style: Themes().titleStyle,
              ),
              const SizedBox(height: 10),
              inputField(
                readOnly: true,
                hintText: _selectedRepeat,
                suffixIcon: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 34,
                    ),
                  ),
                  items: repeatList
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem(
                          value: value.toString(),
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  style: Themes().subTitleStyle,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRepeat = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  colorpalette(),
                  MyButton(
                      label: 'Creat Task',
                      ontap: () {
                        valdidateDate();
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appbar() => AppBar(
          actions: const [
            CircleAvatar(
              backgroundImage: AssetImage('images/person.jpeg'),
            ),
            SizedBox(
              width: 20,
            )
          ],
          elevation: 0,
          backgroundColor: context.theme.backgroundColor,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryClr,
            ),
          ));
  addTasktoDB() async {
    int value = await _taskController.addTasks(
        task: Task(
            title: _tittleEditingController.text,
            note: _noteEditingController.text,
            isCompleted: 0,
            date: DateFormat.yMd().format(_selectedDate),
            startTime: _startTime,
            endTime: _endTime,
            color: _selectedColor,
            remind: _selectedRemind,
            repeat: _selectedRepeat));

    print(value);
  }

  valdidateDate() {
    if (_tittleEditingController.text.isNotEmpty &&
        _noteEditingController.text.isNotEmpty) {
      addTasktoDB();
      Get.back();
    } else if (_tittleEditingController.text.isEmpty ||
        _noteEditingController.text.isEmpty) {
      Get.snackbar(
        'required',
        'All Fields are required !',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
        isDismissible: true,
      );
    } else {
      print('############ WARMING ############');
    }
  }

  Widget colorpalette() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color',
            style: Themes().titleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
              children: List.generate(
                  3,
                  (int? index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = index!;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            child: _selectedColor == index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                            backgroundColor: (index == 0)
                                ? primaryClr
                                : index == 1
                                    ? pinkClr
                                    : orangeClr,
                            radius: 15,
                          ),
                        ),
                      )))
        ],
      );

  getTime({required bool isStart}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStart
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15))),
    );
    String formatedtime = pickedTime!.format(context);

    if (isStart) {
      setState(() {
        _startTime = formatedtime;
      });
    } else if (!isStart) {
      setState(() {
        _endTime = formatedtime;
      });
    } else {
      print('time canceld or something wrong');
    }
  }

  getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2050));
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    } else {
      print('its null or something wrong');
    }
  }
}
