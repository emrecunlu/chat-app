import 'package:chat_client/core/base/base_widget.dart';
import 'package:chat_client/ui/pages/chat/message/widgets/select_image_bottomsheet.dart';
import 'package:flutter/material.dart';

class SelectAvatarCircle extends StatefulWidget {
  const SelectAvatarCircle({super.key});

  @override
  State<SelectAvatarCircle> createState() => _SelectAvatarCircleState();
}

class _SelectAvatarCircleState extends BaseWidget<SelectAvatarCircle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: false,
          useSafeArea: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          builder: (context) => SelectImageBottomSheet(
            onImageSelect: (image) {
              debugPrint(image.toString());
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/empty-avatar.webp"),
              ),
            ),
          ),
          _buildSelectIcon(),
        ],
      ),
    );
  }

  Widget _buildSelectIcon() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: themeData.primaryColor,
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
