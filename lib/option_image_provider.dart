import 'package:animation_circle/option_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionImageProvider extends ChangeNotifier {
  List<OptionImage> _images = [
    OptionImage(
      color: Colors.blue, id: 1,
    ),
    OptionImage(color: Colors.red, id: 2,),
    OptionImage(
      color: Colors.green,
      id: 3,
    )
  ];

  remove(int index) async{
    await Future.delayed(const Duration(milliseconds: 500 ));
    _images.removeWhere((element) => element.id == index);
    notifyListeners();
  }

  List<OptionImage> get images => _images;
}
