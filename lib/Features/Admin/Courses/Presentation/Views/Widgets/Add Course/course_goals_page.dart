import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CourseGoalsPage extends StatefulWidget {
  const CourseGoalsPage(
      {super.key, required this.goalsController, required this.goalsKey});

  final List<TextEditingController> goalsController;
  final GlobalKey<FormState> goalsKey;

  @override
  State<CourseGoalsPage> createState() => _CourseGoalsPageState();
}

class _CourseGoalsPageState extends State<CourseGoalsPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  GlobalKey<AnimatedListState> listKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.goalsKey,
      child: Center(
        child: Column(
          spacing: 20,
          children: [
            Text(
              S.of(context).courseGoals,
              style: AppText.style18Bold(context),
            ),
            Text(
              S.of(context).courseGoalsDescription,
              style: AppText.style16Regular(context),
            ),
            Text(
              S.of(context).courseGoalsNote,
              style: AppText.style14Regular(context),
            ),
            Expanded(
              child: AnimatedList(
                key: listKey,
                controller: scrollController,
                initialItemCount: widget.goalsController.length,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: AlphaNumericField(
                              controller: widget.goalsController[index],
                              label: S.of(context).goalLabel(index + 1),
                              hint: S.of(context).goalHint(index + 1),
                              icon: FontAwesomeIcons.award,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            removeListItem(index);
                          },
                          icon: const Icon(Icons.remove_circle),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                addListItem();
              },
              style: OutlinedButton.styleFrom(
                iconColor: Theme.of(context).iconTheme.color,
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              icon: const Icon(Icons.add_circle_outlined),
              label: Text(
                S.of(context).addGoal,
                style: AppText.style14Regular(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addListItem() async {
    widget.goalsController.add(TextEditingController());
    listKey.currentState?.insertItem(
      widget.goalsController.length - 1,
      duration: const Duration(milliseconds: 300),
    );

    await Future.delayed(
      const Duration(milliseconds: 50),
      () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceIn,
        );
      },
    );
  }

  void removeListItem(int index) {
    if (index != 0) {
      listKey.currentState?.removeItem(
        index,
        duration: const Duration(milliseconds: 300),
        (context, animation) {
          return FadeTransition(
            opacity: animation,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: AlphaNumericField(
                      controller: TextEditingController(),
                      label: S.of(context).goalLabel(index + 1),
                      hint: S.of(context).goalHint(index + 1),
                      icon: FontAwesomeIcons.award,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle),
                ),
              ],
            ),
          );
        },
      );
      widget.goalsController.removeAt(index);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
