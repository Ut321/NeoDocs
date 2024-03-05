import 'package:assignment1/Model/text_model.dart';
import 'package:assignment1/controller/bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarWidgets extends StatelessWidget {
  final List<TestSection> testSections;
  final BarController controller;
  const BarWidgets(
      {super.key, required this.testSections, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int enteredValue = controller.value.value;
      TestSection? currentSection = testSections.firstWhereOrNull((section) {
        return enteredValue >= section.min && enteredValue <= section.max;
      });

      double arrowPosition = ((currentSection!.min + currentSection.max) / 2) *
              MediaQuery.of(context).size.width /
              120 -
          20;

      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: [
                Text(
                  'Value: $enteredValue',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: testSections.map((section) {
                    return Expanded(
                      flex: section.max - section.min,
                      child: Container(
                        color: section.color,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${section.min} - ${section.max}',
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              section.meaning,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1100),
            curve: Curves.easeInOut,
            top: 110.0,
            left: arrowPosition,
            child: Column(
              children: [
                const Icon(Icons.arrow_drop_up, color: Colors.black, size: 40),
                Text(
                  '$enteredValue',
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
