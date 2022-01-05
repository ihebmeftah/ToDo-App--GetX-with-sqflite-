import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: appbar(),
        body: Center(
          child: MyButton(
            label: 'Add Task',
            ontap: () {
              Get.to(const AddTaskPage());
            },
          ),
        ));
  }

  AppBar appbar() {
    return AppBar(
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
            Icons.wb_sunny,
            size: 24,
            color: Get.isDarkMode ? primaryClr : darkGreyClr,
          ),
          onPressed: () {
            ThemeServices().switchTheme();
          },
        ));
  }
}
