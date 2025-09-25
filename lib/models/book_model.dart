import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String id;
  final String bookName;
  final String bookCoverImage;
  final String bookUrl;
  final String bookDescription;
  final String bookCategory;
  final String bookSubCategory;
  final String authorName;
  final Timestamp? timeStamp;
  final String bookPath;

  BookModel({
    required this.authorName,
    required this.bookCategory,
    required this.bookCoverImage,
    required this.bookDescription,
    required this.id,
    required this.bookName,
    required this.bookSubCategory,
    required this.bookUrl,
    this.timeStamp,
    required this.bookPath,
  });

  /// Factory constructor to create a model from Firestore JSON
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      authorName: json['authorName'] ?? "",
      bookCategory: json['bookCategory'] ?? "",
      bookCoverImage: json['bookCoverImage'] ?? "",
      bookDescription: json['bookDescription'] ?? "",
      id: json['id'] ?? "",
      bookName: json['bookName'] ?? "",
      bookSubCategory: json['bookSubCategory'] ?? "",
      bookUrl: json['bookUrl'] ?? "",
      timeStamp: json['timeStamp'] is Timestamp ? json['timeStamp'] : null,
      bookPath: json['bookPath'] ?? "",
    );
  }

  /// Convert model to Firestore JSON
  Map<String, dynamic> toJson() {
    return {
      "authorName": authorName,
      "bookCategory": bookCategory,
      "bookCoverImage": bookCoverImage,
      "bookDescription": bookDescription,
      "id": id,
      "bookName": bookName,
      "bookSubCategory": bookSubCategory,
      "bookUrl": bookUrl,
      "timeStamp": timeStamp ?? FieldValue.serverTimestamp(),
      "bookPath": bookPath,
    };
  }

  /// Debug-friendly string representation
  @override
  String toString() {
    return 'BookModel(id: $id, bookName: $bookName, '
        'authorName: $authorName, category: $bookCategory, bookPath: $bookPath '
        'subCategory: $bookSubCategory, cover: $bookCoverImage, '
        'url: $bookUrl, description: $bookDescription, '
        'timeStamp: $timeStamp)';
  }
}
