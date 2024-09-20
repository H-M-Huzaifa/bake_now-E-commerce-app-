import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class class_sign_up_provider with ChangeNotifier{
bool _isPasswordVisible = false;
bool _isConfirmPasswordVisible = false;

bool get isPasswordVisible => _isPasswordVisible;
bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

void togglePasswordVisibility() {
  _isPasswordVisible = !_isPasswordVisible;
  notifyListeners();
}

void toggleConfirmPasswordVisibility() {
  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
  notifyListeners();
}


String? _imageUrl;

String? get imageUrl => _imageUrl;

late Reference imageToUpload;
XFile? file;

Future<void> pickAndUploadImage() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

  if (file == null) return;

  String uniqueFilename = DateTime.now().millisecondsSinceEpoch.toString();

  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDirImages = referenceRoot.child('images');
  imageToUpload = referenceDirImages.child(uniqueFilename);


  try {
    await imageToUpload.putFile(File(file.path));
    String downloadURL = await imageToUpload.getDownloadURL();

    _imageUrl = downloadURL;  // Update the image URL
    notifyListeners();  // Notify listeners to rebuild the UI
  } catch (e) {
    print(e);
  }

}

}