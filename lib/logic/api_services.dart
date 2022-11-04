import 'package:dio/dio.dart';
import 'package:stack_exchange/logic/constants.dart';
import 'package:stack_exchange/logic/value_listener.dart';
import 'package:stack_exchange/model/answers.dart';
import 'package:logger/logger.dart';
import '../main.dart';
import '../model/questions.dart';

///
///
/// get a set of question from stack exchange
///
///
void getStackExchangeQuestions({required int pageNumber}) async {
  loadingNotifier.value = true;
  try {
    var response = await Dio().get(
        '$stackExchangeBaseURL/2.3/questions?page=${pageNumber.toString()}&pagesize=$numberOfQuestionPerPage&order=desc&sort=activity&site=stackoverflow&filter=!LbL5ahiCTsAr88mR96pg2E');
    loadingNotifier.value = false;
    pageNumberNotifier.value = pageNumber;
    questionsNotifier.value = QuestionsClass.fromJson(response.data);
    logger.e(response.data);
  } catch (e) {
    loadingNotifier.value = false;

    print(e);
  }
}

///
///
/// get an answer to a question
///
///
void getStackExchangeAnswer({required String id}) async {
  loadingNotifier.value = true;
  try {
    var response = await Dio().get('$stackExchangeBaseURL/2.3/questions/$id?order=desc&sort=activity&site=stackoverflow&filter=!6VvPDzP8oxXb5');

    if (response.data != null) {
      if (response.data["items"][0]["answers"] != null) {
        logger.d(response.data);
        answersNotifier.value = AnswersClass.fromJson(response.data);
        showNoAnsweredTextNotifier.value = false;
      } else {
        showNoAnsweredTextNotifier.value = true;
      }
    }
    //
    loadingNotifier.value = false;
    showAnsweredTextNotifier.value = true;
    //
  } catch (e) {
    loadingNotifier.value = false;
    print(e);
  }
}
