import 'dart:io';

import 'package:chat_client/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageBottomSheet extends StatelessWidget {
  final Function(File image) onImageSelect;
  const SelectImageBottomSheet({super.key, required this.onImageSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOutlinedButton(
              source: ImageSource.gallery,
              title: "Galeriden Seç",
              icon: Icon(Icons.image),
            ),
            SizedBox(height: 20),
            _buildOutlinedButton(
              source: ImageSource.camera,
              title: "Resim Çek",
              icon: Icon(Icons.camera_alt_rounded),
            )
          ],
        ));
  }

  Widget _buildOutlinedButton(
      {required String title, required Icon icon, required ImageSource source}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: () async {
          NavigationService.back();
          final imagePicker = ImagePicker();
          final image = await imagePicker.pickImage(source: source);

          if (image == null) return;

          onImageSelect(File(image.path));
        },
        icon: icon,
        label: Text('$title'),
      ),
    );
  }
}
