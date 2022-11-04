// To parse this JSON data, do
//
//     final answersClass = answersClassFromJson(jsonString);

import 'dart:convert';

AnswersClass answersClassFromJson(String str) => AnswersClass.fromJson(json.decode(str));

String answersClassToJson(AnswersClass data) => json.encode(data.toJson());

class AnswersClass {
  AnswersClass({
    this.items,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  List<Item>? items;
  bool? hasMore;
  int? quotaMax;
  int? quotaRemaining;

  factory AnswersClass.fromJson(Map<String, dynamic> json) => AnswersClass(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        hasMore: json["has_more"],
        quotaMax: json["quota_max"],
        quotaRemaining: json["quota_remaining"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "has_more": hasMore,
        "quota_max": quotaMax,
        "quota_remaining": quotaRemaining,
      };
}

class Item {
  Item({
    this.tags,
    this.answers,
    this.owner,
    this.isAnswered,
    this.viewCount,
    this.acceptedAnswerId,
    this.answerCount,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.questionId,
    this.link,
    this.title,
  });

  List<String>? tags;
  List<Answer>? answers;
  Owner? owner;
  bool? isAnswered;
  int? viewCount;
  int? acceptedAnswerId;
  int? answerCount;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? questionId;
  String? link;
  String? title;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        tags: List<String>.from(json["tags"].map((x) => x)),
        answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        owner: Owner.fromJson(json["owner"]),
        isAnswered: json["is_answered"],
        viewCount: json["view_count"],
        acceptedAnswerId: json["accepted_answer_id"],
        answerCount: json["answer_count"],
        score: json["score"],
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        questionId: json["question_id"],
        link: json["link"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
        "owner": owner!.toJson(),
        "is_answered": isAnswered,
        "view_count": viewCount,
        "accepted_answer_id": acceptedAnswerId,
        "answer_count": answerCount,
        "score": score,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "question_id": questionId,
        "link": link,
        "title": title,
      };
}

class Answer {
  Answer({
    this.owner,
    this.isAccepted,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.answerId,
    this.questionId,
    this.contentLicense,
    this.body,
    this.lastEditDate,
  });

  Owner? owner;
  bool? isAccepted;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? answerId;
  int? questionId;
  String? contentLicense;
  String? body;
  int? lastEditDate;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        owner: Owner.fromJson(json["owner"]),
        isAccepted: json["is_accepted"],
        score: json["score"],
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        answerId: json["answer_id"],
        questionId: json["question_id"],
        contentLicense: json["content_license"],
        body: json["body"],
        lastEditDate: json["last_edit_date"] == null ? null : json["last_edit_date"],
      );

  Map<String, dynamic> toJson() => {
        "owner": owner!.toJson(),
        "is_accepted": isAccepted,
        "score": score,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "answer_id": answerId,
        "question_id": questionId,
        "content_license": contentLicense,
        "body": body,
        "last_edit_date": lastEditDate == null ? null : lastEditDate,
      };
}

class Owner {
  Owner({
    this.accountId,
    this.reputation,
    this.userId,
    this.userType,
    this.acceptRate,
    this.profileImage,
    this.displayName,
    this.link,
  });

  int? accountId;
  int? reputation;
  int? userId;
  String? userType;
  int? acceptRate;
  String? profileImage;
  String? displayName;
  String? link;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        accountId: json["account_id"],
        reputation: json["reputation"],
        userId: json["user_id"],
        userType: json["user_type"],
        acceptRate: json["accept_rate"] == null ? null : json["accept_rate"],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
        "reputation": reputation,
        "user_id": userId,
        "user_type": userType,
        "accept_rate": acceptRate == null ? null : acceptRate,
        "profile_image": profileImage,
        "display_name": displayName,
        "link": link,
      };
}
