import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(XFile pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _pickedImage;

  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedImageFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImage = pickedImageFile!;
    });
    widget.imagePickFn(pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    print(_pickedImage);
    return Column(
      children: <Widget>[
        // CircleAvatar(
        //   radius: 40,
        //   backgroundColor: Colors.grey,
        //    Image.asset(name),
        //   backgroundImage:
        //       _pickedImage != null ? FileImage((_pickedImage) as File) : null,
        // ),
        _pickedImage != null
            ? Image.file(File(_pickedImage!.path))
            : Container(),
        //  Image.file

        TextButton.icon(
          // textColor: Theme.of(context).primaryColor,
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text('Camera'),
        ),
      ],
    );
  }
}
