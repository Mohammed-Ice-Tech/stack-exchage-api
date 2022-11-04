// To parse this JSON data, do
//
//     final questionsClass = questionsClassFromJson(jsonString);

import 'dart:convert';

QuestionsClass questionsClassFromJson(String str) => QuestionsClass.fromJson(json.decode(str));

String questionsClassToJson(QuestionsClass data) => json.encode(data.toJson());

class QuestionsClass {
  QuestionsClass({
    this.items,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  List<Item>? items;
  bool? hasMore;
  int? quotaMax;
  int? quotaRemaining;

  factory QuestionsClass.fromJson(Map<String, dynamic> json) => QuestionsClass(
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
    this.owner,
    this.isAnswered,
    this.viewCount,
    this.upVoteCount,
    this.answerCount,
    this.score,
    this.questionId,
    this.title,
    this.body,
  });

  List<String>? tags;
  Owner? owner;
  bool? isAnswered;
  int? viewCount;
  int? upVoteCount;
  int? answerCount;
  int? score;
  int? questionId;
  String? title;
  String? body;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        tags: List<String>.from(json["tags"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        isAnswered: json["is_answered"],
        viewCount: json["view_count"],
        upVoteCount: json["up_vote_count"],
        answerCount: json["answer_count"],
        score: json["score"],
        questionId: json["question_id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "owner": owner!.toJson(),
        "is_answered": isAnswered,
        "view_count": viewCount,
        "up_vote_count": upVoteCount,
        "answer_count": answerCount,
        "score": score,
        "question_id": questionId,
        "title": title,
        "body": body,
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
