// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ImageModel {
  XFile? image;
  ImageModel({this.image});

  Future<FormData?> toconvertImage() async {
    final formdata = FormData();

    if (image != null) {
      final imageMultipartFile = await MultipartFile.fromFile(
        image!.path,
        filename: (image!.path),
      );

      formdata.files.add(MapEntry('images', imageMultipartFile));
    }

    return formdata;
  }
}

class ImageUrl {
  String image;
  ImageUrl({
    required this.image,
  });

  ImageUrl copyWith({
    String? image,
  }) {
    return ImageUrl(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory ImageUrl.fromMap(Map<String, dynamic> map) {
    return ImageUrl(
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageUrl.fromJson(String source) => ImageUrl.fromMap(json.decode(source) as Map<String, dynamic>);


}
