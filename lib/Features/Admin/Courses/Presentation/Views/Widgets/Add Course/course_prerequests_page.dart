import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/Fields/alpha_numeric_field.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class CoursePrerequestsPage extends StatefulWidget {
  const CoursePrerequestsPage({
    super.key,
    required this.prerequestsController,
    required this.prequesetsKey,
  });

  final List<TextEditingController> prerequestsController;
  final GlobalKey<FormState> prequesetsKey;

  @override
  State<CoursePrerequestsPage> createState() => _CoursePrerequestsPageState();
}

class _CoursePrerequestsPageState extends State<CoursePrerequestsPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  GlobalKey<AnimatedListState> listKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.prequesetsKey,
      child: Center(
        child: Column(
          spacing: 20,
          children: [
            Text(
              S.of(context).SkillsAndPrerequisites,
              style: AppText.style18Bold(context),
            ),
            Text(
              S.of(context).skillsAndPrerequisitesDescription,
              style: AppText.style16Regular(context),
              textAlign: TextAlign.center,
            ),
            Text(
              S.of(context).prerequisitesNote,
              style: AppText.style14Regular(context),
            ),
            Text(
              S.of(context).prerequisitesNoneNote,
              style: AppText.style14Regular(context),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: AnimatedList(
                key: listKey,
                controller: scrollController,
                initialItemCount: widget.prerequestsController.length,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: AlphaNumericField(
                              controller: widget.prerequestsController[index],
                              label: S
                                  .of(context)
                                  .prerequisiteSkillLabel(index + 1),
                              hint: S.of(context).prerequisiteSkillHint,
                              icon: FontAwesomeIcons.bookOpenReader,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S
                                      .of(context)
                                      .prerequisiteFieldRequired;
                                }
                                return null;
                              },
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
              icon: const Icon(
                Icons.add_circle_outlined,
              ),
              label: Text(
                S.of(context).addPrerequisiteSkill,
                style: AppText.style14Regular(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addListItem() async {
    widget.prerequestsController.add(TextEditingController());
    listKey.currentState?.insertItem(
      widget.prerequestsController.length - 1,
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
                      label: S.of(context).prerequisiteSkillLabel(index + 1),
                      hint: S.of(context).prerequisiteSkillHint,
                      icon: FontAwesomeIcons.bookOpenReader,
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
      widget.prerequestsController.removeAt(index);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
