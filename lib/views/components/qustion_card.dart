import 'package:flutter/material.dart';

import '../../logic/helper.dart';
import '../../logic/api_services.dart';
import '../../logic/constants.dart';
import '../../logic/value_listener.dart';
import '../main_pages/second_page.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({Key? key, required this.index, required this.answerCount, required this.votesCount, required this.viewsCount})
      : super(key: key);
  final int index;
  final int answerCount;
  final int votesCount;
  final int viewsCount;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: questionsNotifier.value.items![widget.index].questionId!.toString(),
      child: GestureDetector(
        onTap: () {
          showQuestionTextNotifier.value = false;
          showAnsweredTextNotifier.value = false;
          getStackExchangeAnswer(id: questionsNotifier.value.items![widget.index].questionId!.toString());

          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (_, __, ___) => AnswerPage(
                        heroTag: questionsNotifier.value.items![widget.index].questionId!.toString(),
                        questionIndex: widget.index,
                      )));
        },
        child: Container(
          width: 100,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                Colors.blueAccent.shade100,
                Colors.blue.shade200,
              ])),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ValueListenableBuilder(
                valueListenable: showQuestionTextNotifier,
                builder: (context, value, wid) {
                  return showQuestionTextNotifier.value
                      ? Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: FadeInImage.assetNetwork(
                                            image: questionsNotifier.value.items![widget.index].owner!.profileImage!,
                                            placeholder: "assets/AccountIcon2.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      ///
                                      ///
                                      ///
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          questionsNotifier.value.items![widget.index].owner!.displayName.toString(),
                                          maxLines: 1,
                                          style: const TextStyle(fontSize: 10, overflow: TextOverflow.ellipsis),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///
                                ///
                                ///
                                /// votes

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Votes: ${widget.votesCount}",
                                    maxLines: 3,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, overflow: TextOverflow.ellipsis),
                                  ),
                                ),

                                ///
                                ///
                                ///
                                /// Views

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Views: ${widget.viewsCount}",
                                    maxLines: 3,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, overflow: TextOverflow.ellipsis),
                                  ),
                                ),

                                ///
                                ///
                                ///
                                ///Answers

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Answers: ${widget.answerCount}",
                                    maxLines: 3,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, overflow: TextOverflow.ellipsis),
                                  ),
                                )

                                ///
                                ///
                                ///
                              ],
                            ),

                            ///
                            ///
                            ///
                            Column(
                              children: [
                                ///
                                ///
                                ///
                                /// Question title
                                SizedBox(
                                  width: size.width / 1.5,
                                  child: Text(
                                    questionsNotifier.value.items![widget.index].title!,
                                    maxLines: 3,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, overflow: TextOverflow.ellipsis),
                                  ),
                                ),

                                ///
                                ///
                                const SizedBox(
                                  height: 20,
                                ),

                                ///
                                ///
                                ///
                                /// Question Body
                                SizedBox(
                                  width: size.width / 1.5,
                                  height: 55,
                                  child: Text(
                                    getTextBodyWithoutHtmlTags(questionsNotifier.value.items![widget.index].body!.toString()),
                                    maxLines: 3,
                                    style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15, overflow: TextOverflow.ellipsis),
                                  ),
                                ),

                                ///
                                ///
                                ///
                                /// Tags
                                SizedBox(
                                  width: size.width / 1.5,
                                  height: 40,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: questionsNotifier.value.items![widget.index].tags!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Center(
                                            child: Container(
                                              decoration:
                                                  BoxDecoration(color: Colors.indigoAccent.withOpacity(0.58), borderRadius: BorderRadius.circular(5)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  " ${questionsNotifier.value.items![widget.index].tags![index]}",
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Colors.black54,
                                                      overflow: TextOverflow.ellipsis),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ],
                        )
                      : const SizedBox();
                }),
          ),
        ),
      ),
    );
  }
}
