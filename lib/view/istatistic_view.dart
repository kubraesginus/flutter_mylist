import 'package:flutter/material.dart';
import 'package:flutter_mylist/utill/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/database.dart';

class IstatisticView extends StatefulWidget {
  final ToDoDatabese db;
  const IstatisticView({super.key, required this.db});

  @override
  State<IstatisticView> createState() => _IstatisticViewState();
}

class _IstatisticViewState extends State<IstatisticView> {
  late List<GDPData> _chartData;
  int complatedToDoCount = 0;
  int incomplateToDoCount = 0;
  int toDoTotal = 0;

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Not Completed', incomplateToDoCount),
      GDPData('Completed', complatedToDoCount),
      GDPData('ToDoTotal', toDoTotal),
    ];
    return chartData;
  }

  void countTodo() {
    for (var i = 0; i < widget.db.toDoList.length; i++) {
      if (widget.db.toDoList[i][1] == true) {
        complatedToDoCount++;
      } else {
        incomplateToDoCount++;
      }
    }
    toDoTotal = complatedToDoCount + incomplateToDoCount;
    print(
        "tamamlanmış $complatedToDoCount    tamamlanmammış $incomplateToDoCount");
    setState(() {});
  }

  @override
  void initState() {
    countTodo();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(
          text: 'Weekly attitude chart',
          textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              decorationColor: AppColors.mainpurplea,
              backgroundColor: AppColors.mainblue,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              color: AppColors.mainpurplex)),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          borderWidth: 19.7,
          textStyle: TextStyle(
            fontSize: 13.90,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w900,
          )),
      palette: <Color>[
        AppColors.mainblue,
        AppColors.mainpurplea,
        AppColors.mainpurple,
      ],
      series: <CircularSeries>[
        PieSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  decorationThickness: BorderSide.strokeAlignCenter,
                )))
      ],
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
