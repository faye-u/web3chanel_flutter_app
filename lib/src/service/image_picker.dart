import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/progress_dialog.dart';
import '../flutter_ipfs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:tuple/tuple.dart';

// const t = Tuple2<String, int>('a', 10);
class Image {
  XFile image;
  String cid;

  Image(this.image, this.cid);
}

class ImagePickerService {
//PICKER
  static Future<Image?> pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(
        imageQuality: 70,
        maxWidth: 1440,
        source: ImageSource.gallery,
      );

      //Nothing picked
      if (image == null) {
        Fluttertoast.showToast(
          msg: 'No Image Selected',
        );
        return null;
      } else {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => ProgressDialog(
            status: 'Uploading to IPFS',
          ),
        );

        // upload image to ipfs
        final cid = await FlutterIpfs().uploadToIpfs(image.path);
        debugPrint(cid);

        // Popping out the dialog box
        Navigator.pop(context);

        //Return Path
        return Image(image, cid);
      }
    } catch (e) {
      debugPrint('Error at image picker: $e');
      SnackBar(
        content: Text(
          'Error at image picker: $e',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      );
      return null;
    }
  }
}
