// ignore_for_file: unused_field, prefer_const_constructors

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/ui/pages/add_task_page.dart';
import 'package:todo/ui/size_config.dart';
import 'package:todo/ui/theme.dart';
import 'package:todo/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: appbar(),
        body: Column(
          children: [
            _addtaskBar(),
            _addDateBar(),
          ],
        ));
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
            icon: Icon(
              Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round_rounded,
              size: 24,
              color: Get.isDarkMode ? Colors.white : darkGreyClr,
            ),
            onPressed: () {
              ThemeServices().switchTheme();
            },
          ));

  _addtaskBar() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()).toString(),
                style: Themes().headingStyle,
              ),
              Text(
                'Today',
                style: Themes().headingStyle,
              ),
            ],
          ),
          MyButton(
            label: '+ Add Task',
            ontap: () async {
              await Get.to(() => const AddTaskPage());
              _taskController.getTasks();
            },
          )
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        onDateChange: (newDate) {
          setState(() {
            selectedDate = newDate;
          });
        },
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600)),
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)),
        initialSelectedDate: selectedDate,
      ),
    );
  }
}
