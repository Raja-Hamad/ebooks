import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ebooks/utils/extensions/flushbar_messages.dart';
import 'package:flutter/material.dart';

Future<String> uploadPdfToCloudinary(
    File pdfFile,
    BuildContext context,
  ) async {
    final cloudName = 'dqs1y6urv';
    final apiKey = '463369248646777';
    final preset = 'ecommerce_preset';

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/raw/upload', // use `raw` for PDFs
    );

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = preset
      ..files.add(await http.MultipartFile.fromPath('file', pdfFile.path));

    final response = await request.send();
    final res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final data = jsonDecode(res.body);
      FlushBarMessages.successMessageFlushBar(
        "Resume uploaded successfully",
        // ignore: use_build_context_synchronously
        context,
      );
      return data['secure_url'];
    } else {
      FlushBarMessages.errorMessageFlushBar(
        "Failed to upload Resume PDF",
        // ignore: use_build_context_synchronously
        context,
      );
      throw Exception('Failed to upload resume PDF to Cloudinary');
    }

    
  }

   Future<String> uploadImageToCloudinary(
    File imageFile,
    BuildContext context,
  ) async {
    final cloudName = 'dqs1y6urv'; // Replace with your Cloudinary Cloud Name
    final apiKey = '463369248646777'; // Replace with your Cloudinary API Key
    final preset =
        'ecommerce_preset'; // Replace with your Cloudinary Upload Preset

    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = preset
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      // FlushBarMessages.successMessageFlushBar(
      //   "Image Uploaded Successfully",
      //   // ignore: use_build_context_synchronously
      //   context,
      // );
      final res = await http.Response.fromStream(response);
      final data = jsonDecode(res.body);
      return data['secure_url']; // Image URL from Cloudinary
    } else {
      // ignore: use_build_context_synchronously
      FlushBarMessages.errorMessageFlushBar("Failed to upload Image", context);
      throw Exception('Failed to upload image to Cloudinary');
    }
  }
