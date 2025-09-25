import 'dart:io';

import 'package:ebooks/models/book_model.dart';
import 'package:ebooks/services/cloudinary_services.dart';
import 'package:ebooks/services/firestore_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class BookController extends GetxController {
  var bookTitleController = TextEditingController().obs;
  var bookDescriptionController = TextEditingController().obs;
  var bookAuthorController = TextEditingController().obs;
  var bookCateogryController = TextEditingController().obs;
  var bookSubCategoryController = TextEditingController().obs;
  var selectedImage = Rxn<File>();
  final FirestoreServices _firestoreServices = FirestoreServices();
  var isLoading = false.obs;
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  Future<void> addBook(
    BuildContext context,
    String collectionname,
    String bookTitle,
    String bookDescription,
    String bookAuthor,
    String category,
    String subCategory,
    File? imageFile,
    File? pdfFile,
    String bookPath
  ) async {
    try {
      isLoading.value = true;
      String coverImageUrl = await uploadImageToCloudinary(imageFile!, context);
      String pdfUrl = await uploadPdfToCloudinary(pdfFile!, context);
      BookModel model = BookModel(
        bookPath: bookPath.toString(),
        authorName: bookAuthor.toString(),
        bookCategory: category.toString(),
        bookCoverImage: coverImageUrl.toString(),
        bookDescription: bookDescription,
        id: Uuid().v4(),
        bookName: bookTitle.toString(),
        bookSubCategory: subCategory.toString(),
        bookUrl: pdfUrl.toString(),
      );
      await _firestoreServices.addMethod(context, model, collectionname);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Error while adding the book is ${e.toString()}");
      }
    }
  }
}
