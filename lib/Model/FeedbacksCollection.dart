class FeedbacksCollection {
  final String description;
  final String uID;
  final String oID;
  final String owner;
  final int rating;
  final String email;

  FeedbacksCollection({
    required this.description,
    this.uID = '',
    this.oID = '',
    this.owner = '',
    this.rating = 1,
    this.email = '',
  });
}
