import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class StudentLineChart extends StatefulWidget {
  const StudentLineChart({
    super.key,
    required this.data,
    required this.rodColors,
  });

  final Map<String, List<int>> data;
  final List<Color> rodColors;

  @override
  State<StudentLineChart> createState() => _StudentLineChartState();
}

class _StudentLineChartState extends State<StudentLineChart> {
  int touchedGroupIndex = -1;

  List<BarChartGroupData> groups = [];

  List<BarChartGroupData> rawGroups = [];

  @override
  void initState() {
    for (int i = 0; i < widget.data.length; i++) {
      groups.add(
        createGroup(
          i,
          widget.data.values.elementAt(i),
          widget.rodColors,
        ),
      );
    }

    rawGroups = groups;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.3,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: getBottomTitlesWidget,
                showTitles: true,
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: getPercenteges,
                showTitles: true,
                interval: 1,
                reservedSize: 30,
              ),
            ),
          ),
          gridData: const FlGridData(
            show: false,
          ),
          barGroups: groups,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBorderRadius: BorderRadius.circular(16),
              getTooltipColor: (group) {
                return Colors.white;
              },
            ),
            allowTouchBarBackDraw: true,
            touchCallback: (event, response) {
              double avg = 0;
              if (response == null || response.spot == null) {
                touchedGroupIndex = -1;
                setState(() {});
              } else {
                touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                avg = getAverage(response);
                touchRespond(avg, event);
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
  }

  void touchRespond(double avg, FlTouchEvent event) {
    if (!event.isInterestedForInteractions) {
      touchedGroupIndex = -1;
      groups = List.of(rawGroups);
      return;
    }
    groups = List.of(rawGroups);
    if (touchedGroupIndex != -1) {
      groups[touchedGroupIndex] = groups[touchedGroupIndex].copyWith(
        barRods: groups[touchedGroupIndex].barRods.map(
          (e) {
            return e.copyWith(
              color: const Color(0xFF1F509A),
              toY: avg,
            );
          },
        ).toList(),
      );
    }
  }

  double getAverage(BarTouchResponse response) {
    double sum = 0;
    int items = 0;
    for (var element in response.spot!.touchedBarGroup.barRods) {
      sum += element.toY;
      if (element.toY != 0) {
        items++;
      }
    }
    return sum / items;
  }

  BarChartGroupData createGroup(int x, List<int> rods, List<Color> rodColors) {
    return BarChartGroupData(
      x: x,
      barsSpace: 5,
      barRods: rods
          .asMap()
          .entries
          .map(
            (e) => BarChartRodData(
              toY: e.value.toDouble(),
              color: rodColors[e.key],
              width: 5,
            ),
          )
          .toList(),
    );
  }

  Widget getBottomTitlesWidget(double num, TitleMeta meta) {
    final Widget text = Text(
      widget.data.keys.elementAt(num.toInt()),
      style: AppText.style14Bold(context),
    );

    return SideTitleWidget(
      meta: meta,
      space: 16, //margin top
      child: text,
    );
  }

  Widget getPercenteges(double value, TitleMeta meta) {
    double percents = 0;
    for (var element in groups) {
      for (var element1 in element.barRods) {
        if (value == element1.toY) {
          percents = value;
        }
      }
    }

    if (percents == 0) {
      return Container();
    }

    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Text(
        AppDates.formatLocalizedNumber(percents.toInt(), context),
        style: AppText.style14Bold(context),
      ),
    );
  }
}
