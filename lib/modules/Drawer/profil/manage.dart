import 'package:flutter/material.dart';

class ImageProviderNotifier extends ChangeNotifier {
  ImageProvider _coverImage = AssetImage('assets/images/c.jpg');
  ImageProvider _profileImage = AssetImage('assets/images/moana.png');

  ImageProvider get coverImage => _coverImage;
  ImageProvider get profileImage => _profileImage;

  void setCoverImage(ImageProvider image) {
    _coverImage = image;
    notifyListeners();
  }

  void setProfileImage(ImageProvider image) {
    _profileImage = image;
    notifyListeners();
  }
}
