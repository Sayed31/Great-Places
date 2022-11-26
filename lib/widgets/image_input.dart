import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
//This is a great plug in which makes it very easy to work with the device camera,
// select the image or
// take an image and then work with that image.

class imageInput extends StatefulWidget {
  const imageInput({Key? key}) : super(key: key);

  @override
  State<imageInput> createState() => _imageInputState();
}

class _imageInputState extends State<imageInput> {
  // late File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
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
          child:
              // _storedImage != null
              //     ? Image.file(
              //   _storedImage,
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              // )
              //     :
              Text(
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
