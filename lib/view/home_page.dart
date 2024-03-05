import 'package:assignment1/Model/text_model.dart';
import 'package:assignment1/controller/bar_controller.dart';
import 'package:assignment1/view/bar_screen.dart';
import 'package:assignment1/view/widgets/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final BarController barController = Get.put(BarController());

  final List<TestSection> testSections = [
    TestSection(min: 0, max: 30, meaning: 'Dangerous', color: Colors.red),
    TestSection(min: 30, max: 40, meaning: 'Moderate', color: Colors.orange),
    TestSection(min: 40, max: 60, meaning: 'Ideal', color: Colors.green),
    TestSection(min: 60, max: 70, meaning: 'Moderate', color: Colors.orange),
    TestSection(min: 70, max: 120, meaning: 'Dangerous', color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assignment: Neodocs'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: BarWidgets(
              testSections: testSections,
              controller: barController,
            ),
          ),
          TextFieldWidget(controller: barController),
        ],
      ),
    );
  }
}
