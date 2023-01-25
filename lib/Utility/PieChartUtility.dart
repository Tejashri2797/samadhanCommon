import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View_mdal/PieChartVM.dart';

final picChartVM =Get.put(PicChartVM());
List<PieChartSectionData> showingSections() {
  return  List.generate(5, (i) {
    switch (i) {
      case 0:
        return PieChartSectionData(

          color: const Color(0xFF81D4FA),
          value:  count1!.toDouble(),
          title: "$count1",
          radius:40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 1:
        return PieChartSectionData(
          color: const Color(0xFFFBC02D),
          value: count2!.toDouble(),
          title: '$count2',
          radius: 40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 2:
        return PieChartSectionData(
          color: const Color(0xFFB388FF),
          value: count3!.toDouble(),
          title: '$count3',
          radius: 40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 3:
        return PieChartSectionData(
          color: const Color(0xFFAED581),
          value:  count4!.toDouble(),
          title: '$count4',
          radius: 40,
          titleStyle: TextStyle(
            fontSize:15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 4:
        return PieChartSectionData(
          color: Colors.red.shade400,
          value:  count5!.toDouble(),
          title: '$count5',
          radius: 40,
          titleStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        );
      default:
        throw Error();
    }
  });
}
