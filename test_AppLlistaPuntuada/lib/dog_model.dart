import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Dog {
  final String name;
  final String location;
  final String description;
  String urlImage;
  String imageUrl;

  int rating = 10;

  Dog(this.name, this.location, this.description, this.urlImage);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    try {
      imageUrl = this.urlImage;
    } catch (exception) {
      print(exception);
    }
  }
}
