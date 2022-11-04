import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stack_exchange/views/main_pages/second_page.dart';

import '../../logic/constants.dart';
import '../../logic/api_services.dart';
import '../../logic/value_listener.dart';
import '../../main.dart';
import '../components/loading.dart';
import '../components/no_answer_popup.dart';
import '../components/qustion_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///
  /// initial state
  ///
  @override
  void initState() {
    getStackExchangeQuestions(pageNumber: 1);
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.barsStaggered,
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

      ///
      /// ///
      /// /// ///
      /// /// /// ///
      /// /// ///
      /// ///
      ///
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Stack Overflow",
                        style: TextStyle(color: Colors.black54, fontSize: 28),
                      ),
                    ),
                  ),

                  ///
                  ///
                  ///
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 50,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[50]!),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.shade100,
                          ),
                          BoxShadow(
                            color: Colors.grey.shade100,
                            spreadRadius: -1,
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///
                          ///
                          ///
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              "Search",
                              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                            ),
                          ),

                          ///
                          ///
                          ///
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                                Colors.blueAccent.shade100,
                                Colors.blue.shade200,
                              ]),
                            ),
                            width: 50,
                            height: 50,
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///
                  ValueListenableBuilder(
                      valueListenable: pageNumberNotifier,
                      builder: (context, value, widget) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///
                            ///
                            ///
                            IconButton(
                              onPressed: () {
                                /// minimum number is 1
                                ///
                                if (pageNumberNotifier.value > 1) {
                                  getStackExchangeQuestions(pageNumber: pageNumberNotifier.value - 1);
                                }
                              },
                              icon: const FaIcon(FontAwesomeIcons.squareCaretLeft),
                            ),

                            ///
                            ///
                            ///
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(pageNumberNotifier.value.toString()),
                            ),

                            ///
                            ///
                            ///
                            IconButton(
                              onPressed: () {
                                /// maximum number is 999
                                ///
                                if (pageNumberNotifier.value < 999) {
                                  getStackExchangeQuestions(pageNumber: pageNumberNotifier.value + 1);
                                }
                              },
                              icon: const FaIcon(FontAwesomeIcons.squareCaretRight),
                            )
                          ],
                        );
                      }),

                  ///
                  ///
                  ///
                  ValueListenableBuilder(
                      valueListenable: questionsNotifier,
                      builder: (context, value, wid) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: size.height / 1.45,
                            width: size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: questionsNotifier.value.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1000),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          ///
                                          ///
                                          ///
                                          ///

                                          child: QuestionCard(
                                            index: index,
                                            answerCount: questionsNotifier.value.items![index].answerCount!,
                                            votesCount: questionsNotifier.value.items![index].viewCount!,
                                            viewsCount: questionsNotifier.value.items![index].viewCount!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      })
                ],
              ),
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
                  logger.i("Loading Notifier Changes ${loadingNotifier.value}");
                  return loadingNotifier.value ? const ConnectingProgress() : const SizedBox();
                }),
          ],
        ),
      ),
    );
  }
}
