// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payLoad}) : super(key: key);
  final String payLoad;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? _payLoad;
  @override
  void initState() {
    super.initState();
    _payLoad = widget.payLoad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
          title: Text(
            _payLoad.toString().split('|')[0],
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
          ),
          elevation: 0,
          backgroundColor: context.theme.backgroundColor,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          )),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                'Hello,Iheb',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : darkGreyClr,
                    fontSize: 26,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'You have new reminder',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            margin: const EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: primaryClr),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.text_format,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Title',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _payLoad.toString().split('|')[0],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.description,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _payLoad.toString().split('|')[1],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.date_range,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _payLoad.toString().split('|')[2],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
