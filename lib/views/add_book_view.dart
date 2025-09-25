import 'dart:io';
import 'package:ebooks/controllers/book_controller.dart';
import 'package:ebooks/utils/extensions/flushbar_messages.dart';
import 'package:ebooks/widgets/reusable_button.dart';
import 'package:ebooks/widgets/textfield_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({super.key});

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  PlatformFile? selectedFile;

  Future<void> pickResumeFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFile = result.files.first;
      });
    }
  }

  void removeFile() {
    setState(() {
      selectedFile = null;
    });
  }

  void disposeValues() {
    _bookController.bookTitleController.value.clear();
    _bookController.bookDescriptionController.value.clear();
    _bookController.bookAuthorController.value.clear();
    _bookController.bookSubCategoryController.value.clear();
    _bookController.bookCateogryController.value.clear();
    _bookController.selectedImage.value = null;
    selectedFile = null;
  }

  String resumeUrl = '';
  BookController _bookController = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    File? file;
    String? fileSize;

    if (selectedFile != null) {
      file = File(selectedFile!.path!);
      fileSize = formatBytes(selectedFile!.size);
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  "Add Book",
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Obx(() {
                    return InkWell(
                      onTap: _bookController.pickImageFromGallery,
                      child: _bookController.selectedImage.value == null
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: const Icon(Icons.camera_alt),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(
                                40,
                              ), // Make it circular
                              child: Image.file(
                                _bookController.selectedImage.value!,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                TextFieldWidget(
                  controller: _bookController.bookTitleController.value,
                  hintText: "Enter book title",
                  title: "Book Title",
                  suffixIcon: Icons.title,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: _bookController.bookAuthorController.value,
                  hintText: "Enter author name",
                  title: "Book Author",
                  suffixIcon: Icons.title,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: _bookController.bookDescriptionController.value,
                  hintText: "Enter book description",
                  title: "Book Description",
                  suffixIcon: Icons.title,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: _bookController.bookCateogryController.value,
                  hintText: "Enter book category",
                  title: "Book Category",
                  suffixIcon: Icons.title,
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: _bookController.bookSubCategoryController.value,
                  hintText: "Enter book subcategory",
                  title: "Book Sub Category",
                  suffixIcon: Icons.title,
                ),
                const SizedBox(height: 20),
                Text(
                  "Upload Book",
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  "Add your book pdf to add book.",
                  style: GoogleFonts.dmSans(
                    color: Color(0xff524B6B),
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 20),
                selectedFile == null
                    ? GestureDetector(
                        onTap: () {
                          pickResumeFile();
                        },
                        child: DottedBorder(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.upload_file,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Upload Book PDF",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : DottedBorder(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xffF0EEF8),
                            border: Border.all(color: const Color(0xff9D97B5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  onTap: () {},
                                  subtitle: Text(
                                    fileSize!,
                                    style: GoogleFonts.dmSans(
                                      color: Color(0xffAAA6B9),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  leading: SvgPicture.asset(
                                    "assets/svgs/pdf_logo.svg",
                                  ),
                                  title: Text(
                                    selectedFile!.name,
                                    style: GoogleFonts.openSans(
                                      color: Color(0xff150B3D),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 24),
                                GestureDetector(
                                  onTap: () {
                                    removeFile();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.delete, color: Colors.red),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Remove file",
                                        style: GoogleFonts.dmSans(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 40),
                Obx(() {
                  return ReusableButton(
                    isLoading: _bookController.isLoading.value,
                    onPress: () {
                      if (_bookController.bookTitleController.value.text
                              .trim()
                              .isEmpty ||
                          _bookController.bookAuthorController.value.text
                              .trim()
                              .isEmpty ||
                          _bookController.bookDescriptionController.value.text
                              .trim()
                              .isEmpty ||
                          _bookController.bookCateogryController.value.text
                              .trim()
                              .isEmpty ||
                          _bookController.bookSubCategoryController.value.text
                              .trim()
                              .isEmpty ||
                          _bookController.selectedImage.value == null ||
                          file == null) {
                        FlushBarMessages.errorMessageFlushBar(
                          "Kindly fill all fields",
                          context,
                        );
                      } else {
                        _bookController
                            .addBook(
                              context,
                              "books",
                              _bookController.bookTitleController.value.text
                                  .trim(),
                              _bookController
                                  .bookDescriptionController
                                  .value
                                  .text
                                  .trim(),
                              _bookController.bookAuthorController.value.text
                                  .trim(),
                              _bookController.bookCateogryController.value.text
                                  .trim(),
                              _bookController
                                  .bookSubCategoryController
                                  .value
                                  .text
                                  .trim(),
                              _bookController.selectedImage.value != null
                                  ? File(
                                      _bookController.selectedImage.value!.path,
                                    )
                                  : null,
                              file,
                            selectedFile!.path!
                            )
                            .then((value) {
                              FlushBarMessages.successMessageFlushBar(
                                "Successfully added the book",
                                context,
                              );
                              disposeValues();
                              removeFile();
                            });
                      }
                    },

                    title: "Add Book",
                  );
                }),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatBytes(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else if (bytes >= 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else {
      return '$bytes B';
    }
  }
}
