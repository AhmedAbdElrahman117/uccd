import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/app_text.dart';

class StatisticsBox extends StatelessWidget {
  const StatisticsBox({
    super.key,
    required this.sections,
    required this.colors,
    required this.sectionTitle,
  });

  final String sectionTitle;
  final Map<String, dynamic> sections;
  final List<dynamic> colors;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      horizontalPadding: 24,
      verticalPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: sectionTitle,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.sizeOf(context).height * 0.12,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
            ),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return Card(
                color: colors[index],
                elevation: 6,
                shadowColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          sections.keys.elementAt(index),
                          style: AppText.style18Bold(context).copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          sections.values.elementAt(index) is String
                              ? sections.values.elementAt(index)
                              : sections.values.elementAt(index).toString(),
                          style: AppText.style16Bold(context).copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
