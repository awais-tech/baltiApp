import 'package:flutter/cupertino.dart';

class Resturent with ChangeNotifier {
  String id;

  String imageUrl;

  String name;
  String description;
  String location;
  String createdby;

  Resturent({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.location,
    required this.createdby,
  });
}
