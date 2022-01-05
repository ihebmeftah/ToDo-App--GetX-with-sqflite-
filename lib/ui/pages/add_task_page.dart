// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
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
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _noteEditingController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();
  final String _startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString();
  final String _endTime = DateFormat('hh:mm a')
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
              inputField(hintText: 'Title', controller: _textEditingController),
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
                    onPressed: () {},
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
                              onPressed: () {},
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
                              onPressed: () {},
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
                        Get.back();
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

  Widget colorpalette() => Column(
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
}
