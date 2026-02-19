import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class StudentPieChart extends StatefulWidget {
  const StudentPieChart({
    super.key,
    required this.piechartData,
    required this.colors,
  });

  final Map<double, int> piechartData;
  final List<Color> colors;

  @override
  State<StudentPieChart> createState() => _StudentPieChartState();
}

class _StudentPieChartState extends State<StudentPieChart> {
  int currentIndex = -1;

  bool allZero = false;

  @override
  void initState() {
    allZero = widget.piechartData.values.every(
      (element) => element == 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 55,
          sectionsSpace: 10,
          sections: allZero
              ? List.generate(
                  widget.colors.length,
                  (index) => PieChartSectionData(
                    color: widget.colors[index],
                    radius: currentIndex == index ? 55 : 40,
                    value: 100 / widget.colors.length,
                    showTitle: true,
                    title: currentIndex == index
                        ? AppDates.formatLocalizedNumber(0, context)
                        : '${AppDates.formatLocalizedNumber(0, context)}%',
                    titleStyle: currentIndex == index
                        ? AppText.style16Bold(context)
                        : AppText.style14Bold(context),
                  ),
                )
              : widget.piechartData.entries.indexed.map(
                  (e) {
                    return PieChartSectionData(
                      color: widget.colors[e.$1],
                      radius: currentIndex == e.$1 ? 55 : 40,
                      value: e.$2.key,
                      showTitle: true,
                      title: currentIndex == e.$1
                          ? AppDates.formatLocalizedNumber(e.$2.value, context)
                          : '${AppDates.formatLocalizedPercent(e.$2.key / 100, context)}',
                      titleStyle: currentIndex == e.$1
                          ? AppText.style16Bold(context).copyWith(
                              color: Colors.white,
                            )
                          : AppText.style14Bold(context).copyWith(
                              color: Colors.white,
                            ),
                    );
                  },
                ).toList(),
          pieTouchData: PieTouchData(
            enabled: true,
            touchCallback: (event, pieTouchResponse) {
              if (pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                setState(() {
                  currentIndex = -1;
                });
              } else {
                setState(
                  () {
                    currentIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
