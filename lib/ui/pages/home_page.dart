// ignore_for_file: unused_field, prefer_const_constructors, unused_element

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task.dart';
import 'package:todo/services/notification_services.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/ui/pages/add_task_page.dart';
import 'package:todo/ui/size_config.dart';
import 'package:todo/ui/theme.dart';
import 'package:todo/ui/widgets/button.dart';
import 'package:todo/ui/widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIosPermission();
    notifyHelper.intializeNotification();
  }

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
            SizedBox(
              height: 20,
            ),
            _showTasks(),
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
              NotifyHelper().dispalyNotification(
                  title: 'theme changed', body: 'theme changed');
              //  NotifyHelper().scheduledNotifications();
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

  _showTasks() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showBottomSheet(
              context,
              Task(
                  title: 'xml',
                  startTime: '20.50',
                  endTime: ' 23.00',
                  color: 1,
                  note: 'klfnqfnfdfjqnbfjdfqfqlffjfbql',
                  isCompleted: 1));
        },
        child: TaskTile(Task(
            title: 'xml',
            startTime: '20.50',
            endTime: ' 23.00',
            color: 1,
            note: 'klfnqfnfdfjqnbfjdfqfqlffjfbql',
            isCompleted: 1)),
      ),
    );
    // return Obx(() {
    //   if (_taskController.taskList.isEmpty) {
    //     return _notTasks();
    //   } else {
    //     return Container();
    //   }
    // });
  }

  _notTasks() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(microseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? SizedBox(height: 6)
                    : SizedBox(height: 220),
                SvgPicture.asset(
                  'images/task.svg',
                  height: 90,
                  color: primaryClr.withOpacity(0.5),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Text(
                    'You do not have any task yet! \n add new task to make your days productive',
                    style: Themes().subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizeConfig.orientation == Orientation.landscape
                    ? SizedBox(height: 120)
                    : SizedBox(height: 180),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildBottomSheet(
      {required String label,
      required Function() onTap,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? Themes().titleStyle
                : Themes().titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 4),
            width: SizeConfig.screenWidth,
            height: (SizeConfig.orientation == Orientation.landscape)
                ? (task.isCompleted == 1
                    ? SizeConfig.screenHeight * 0.6
                    : SizeConfig.screenHeight * 0.8)
                : (task.isCompleted == 1
                    ? SizeConfig.screenHeight * 0.30
                    : SizeConfig.screenHeight * 0.39),
            color: Get.isDarkMode ? darkHeaderClr : Colors.white,
            child: Column(
              children: [
                Flexible(
                    child: Container(
                  height: 6,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                          Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
                )),
                SizedBox(
                  height: 20,
                ),
                task.isCompleted == 1
                    ? Container()
                    : _buildBottomSheet(
                        label: 'Task completed',
                        onTap: () {
                          Get.back();
                        },
                        clr: primaryClr),
                _buildBottomSheet(
                    label: 'Delete completed',
                    onTap: () {
                      Get.back();
                    },
                    clr: primaryClr),
                Divider(
                  color: Get.isDarkMode ? Colors.grey : darkGreyClr,
                ),
                _buildBottomSheet(
                    label: 'Cancel completed',
                    onTap: () {
                      Get.back();
                    },
                    clr: primaryClr),
                SizedBox(
                  height: 20,
                )
              ],
            )),
      ),
    );
  }
}
