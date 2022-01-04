import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/ui/pages/add_task_page.dart';
import 'package:todo/ui/size_config.dart';
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
        appBar: AppBar(
            elevation: 0,
            backgroundColor: context.theme.backgroundColor,
            leading: IconButton(
              onPressed: () {
                ThemeServices().switchTheme();
              },
              icon: const Icon(Icons.dark_mode_outlined),
            )),
        body: Center(
          child: MyButton(
            label: 'Add Task',
            ontap: () {
              Get.to(const AddTaskPage());
            },
          ),
        ));
  }
}
