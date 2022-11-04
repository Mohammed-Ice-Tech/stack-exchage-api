import 'package:flutter/cupertino.dart';
import 'package:stack_exchange/model/answers.dart';

import '../model/questions.dart';

final loadingNotifier = ValueNotifier(false);
final questionsNotifier = ValueNotifier<QuestionsClass>(QuestionsClass(items: [], hasMore: false, quotaMax: 0, quotaRemaining: 0));
final answersNotifier = ValueNotifier<AnswersClass>(AnswersClass(items: [], hasMore: false, quotaMax: 0, quotaRemaining: 0));
final showQuestionTextNotifier = ValueNotifier(true);
final showAnsweredTextNotifier = ValueNotifier(true);
final showNoAnsweredTextNotifier = ValueNotifier(false);
final pageNumberNotifier = ValueNotifier<int>(1);
