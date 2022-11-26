import 'package:flutter/material.dart';
import 'dart:io';

class imageInput extends StatefulWidget {
  const imageInput({Key? key}) : super(key: key);

  @override
  State<imageInput> createState() => _imageInputState();
}

class _imageInputState extends State<imageInput> {
  // late File _storedImage;
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
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
