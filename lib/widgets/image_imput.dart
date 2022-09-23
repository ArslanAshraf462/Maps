import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

 Future<void> _takePicture() async {
    final imageFile = await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      );
      setState(() {
        _storedImage = File(imageFile!.path);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
              ),
          ),
          child: _storedImage != null 
          ?Image.file(
            _storedImage!,
            fit: BoxFit.cover, 
            width: double.infinity,
            ) 
          : Text('No Image Taken',textAlign: TextAlign.center,) ,
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10.0,
          ),
          Expanded(
            child: TextButton.icon(
              onPressed: _takePicture, 
              icon: Icon(Icons.camera), 
              label: Text('Take Picture'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              ),
              ),
        ],
    );
  }
}