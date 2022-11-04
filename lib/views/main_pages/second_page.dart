import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../logic/constants.dart';
import '../../logic/value_listener.dart';
import '../components/loading.dart';
import '../components/no_answers_yet.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({Key? key, required this.heroTag, required this.questionIndex}) : super(key: key);
  final String heroTag;
  final int questionIndex;
  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Timer(const Duration(milliseconds: 400), () {
          showQuestionTextNotifier.value = true;
        });
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: () {
              Timer(const Duration(milliseconds: 400), () {
                showQuestionTextNotifier.value = true;
              });
              showQuestionTextNotifier.value = false;
              Get.back();
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black54,
              size: 17,
            ),
          ),
          actions: const [
            IconButton(
                onPressed: null,
                icon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.black54,
                  size: 17,
                ))
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Hero(
                  tag: widget.heroTag,
                  child: Container(
                    height: size.height / 1.2,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                          Colors.blueAccent.shade100,
                          Colors.blue.shade200,
                        ])),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Transform.translate(
                            offset: const Offset(0, -30),
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(questionsNotifier.value.items![widget.questionIndex].owner!.profileImage!),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                ValueListenableBuilder(
                                    valueListenable: showAnsweredTextNotifier,
                                    builder: (context, value, wid) {
                                      return showAnsweredTextNotifier.value
                                          ? Text(questionsNotifier.value.items![widget.questionIndex].owner!.displayName.toString())
                                          : const SizedBox();
                                    })
                              ],
                            ),
                          ),
                        ),

                        ///
                        ///
                        ///
                        ///
                        ValueListenableBuilder(
                            valueListenable: showAnsweredTextNotifier,
                            builder: (context, value, wid) {
                              return showAnsweredTextNotifier.value
                                  ? ValueListenableBuilder(
                                      valueListenable: answersNotifier,
                                      builder: (context, value, wid) {
                                        return showNoAnsweredTextNotifier.value == false
                                            ? SizedBox(
                                                height: size.height / 1.5,
                                                child: SingleChildScrollView(
                                                  physics: const ScrollPhysics(),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        ///
                                                        ///
                                                        ///
                                                        ///
                                                        ///
                                                        Padding(
                                                          padding: const EdgeInsets.all(12.0),
                                                          child: Container(
                                                            width: size.width,
                                                            decoration: BoxDecoration(boxShadow: const [
                                                              BoxShadow(
                                                                color: Colors.white24,
                                                                blurRadius: 2,
                                                                spreadRadius: 2,
                                                              )
                                                            ], borderRadius: BorderRadius.circular(20), color: Colors.white),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Html(
                                                                data:
                                                                    "<h1>Question: \n</h1>${questionsNotifier.value.items![widget.questionIndex].body!}",
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        answersNotifier.value.items!.isNotEmpty
                                                            ? answersNotifier.value.items![0].answers!.isNotEmpty
                                                                ? ListView.builder(
                                                                    physics: const NeverScrollableScrollPhysics(),
                                                                    shrinkWrap: true,
                                                                    itemCount: answersNotifier.value.items![0].answers!.length,
                                                                    itemBuilder: (BuildContext context, int index) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets.all(12.0),
                                                                        child: Container(
                                                                          width: size.width / 1.35,
                                                                          decoration: BoxDecoration(
                                                                              boxShadow: const [
                                                                                BoxShadow(
                                                                                  color: Colors.white24,
                                                                                  blurRadius: 2,
                                                                                  spreadRadius: 2,
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(20),
                                                                              gradient: const LinearGradient(
                                                                                  begin: Alignment.topLeft,
                                                                                  end: Alignment.bottomRight,
                                                                                  colors: [
                                                                                    Colors.white60,
                                                                                    Colors.white70,
                                                                                  ])),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: Stack(
                                                                              children: [
                                                                                ///
                                                                                ///
                                                                                /// answer body
                                                                                Html(
                                                                                  data:
                                                                                      "<h1>Answer: \n</h1>${answersNotifier.value.items![0].answers![index].body!}",
                                                                                ),
                                                                                Align(
                                                                                  alignment: Alignment.topRight,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                        child: Column(
                                                                                          children: [
                                                                                            const FaIcon(FontAwesomeIcons.squareCaretUp, size: 16),
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.all(5.0),
                                                                                              child: Text(questionsNotifier
                                                                                                  .value.items![0].upVoteCount
                                                                                                  .toString()),
                                                                                            ),
                                                                                            const FaIcon(
                                                                                              FontAwesomeIcons.squareCaretDown,
                                                                                              size: 16,
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),

                                                                                      ///
                                                                                      ///
                                                                                      /// check mark for accepted answer
                                                                                      answersNotifier.value.items![0].answers![index].isAccepted ==
                                                                                              true
                                                                                          ? const Align(
                                                                                              alignment: Alignment.topRight,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.circleCheck,
                                                                                                  color: Colors.green,
                                                                                                  size: 30,
                                                                                                ),
                                                                                              ),
                                                                                            )
                                                                                          : const SizedBox(),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  )
                                                                : const NoAnswersYet()
                                                            : const SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const NoAnswersYet();

                                        ///
                                        ///
                                        ///
                                        ///
                                      })
                                  : const SizedBox();
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),

            ///
            /// ///
            /// /// ///
            /// /// /// ///
            /// // Loading
            /// /// /// ///
            /// /// ///
            /// ///
            ///
            ValueListenableBuilder(
                valueListenable: loadingNotifier,
                builder: (context, value, widget) {
                  return loadingNotifier.value ? const ConnectingProgress() : const SizedBox();
                }),
          ],
        ),
      ),
    );
  }
}
