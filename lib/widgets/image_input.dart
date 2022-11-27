import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

//This is a great plug in which makes it very easy to work with the device camera,
// select the image or
// take an image and then work with that image.
import 'package:path_provider/path_provider.dart' as syspaths;
// this is a package which helps you get access to the paths
// iOS and Android give you to store data in.
import 'package:path/path.dart' as path;
// The path package provides common operations for manipulating paths: joining, splitting,
// normalizing, etc. so basically it helps with constructing the path that found n gained to
//acces by the path provider. This package helps us with combining paths basically.

class imageInput extends StatefulWidget {
  imageInput(this._saveImage);
  Function _saveImage;

  @override
  State<imageInput> createState() => _imageInputState();
}

class _imageInputState extends State<imageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile != null) {
      setState(() {
        _storedImage = File(imageFile!
            .path); // what u get from pickimage is not a file it a picked file
        // so to convert it to file we use File constructor and pss to it the path of the imageFile
      });
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageFile.path);
      print("--------------------> $fileName");
      //gives you The part of a path after the last separator,
      // which is a complex name for saying the file name.

      final savedImage = await _storedImage!
          .copy('${appDir.path}/${fileName}'); // copying the image to a path
      // in the device hard for storing it there
      // we could just typed await _storedImage!
      //           .copy(appDir);
      // but you also have to provide the name of the image it should have.
      // n i wanted to store it with the image name automatically assigned to it
      widget._saveImage(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            icon: Icon(
              Icons.camera,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Take Picture',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
