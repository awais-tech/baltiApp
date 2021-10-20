import 'package:flutter/cupertino.dart';

class FeedbacksCollection with ChangeNotifier {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String description;
  final double rating;
  bool isComment;

  FeedbacksCollection(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.rating,
      required this.description,
      this.isComment = true});
  void toggleCommentStatus() {
    var old = isComment;

    isComment = !isComment;
    notifyListeners();
  }
}
