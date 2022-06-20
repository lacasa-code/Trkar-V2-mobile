import 'dart:io';

// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trkar/core/helper/helper.dart';
import './image_picker_dialog.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({
    Key? key,
    required this.onPicked,
  }) : super(key: key);
  final void Function(File?) onPicked;

  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  // Uint8List bytesImage;
  // String fileName;
  // Uint8List fileBytes;
  String? url;
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: ScreenUtil().radius(45),
              backgroundColor: Color(0xff9E9E9E),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: ScreenUtil().radius(44),
                backgroundImage: pickedImage == null
                    ? (Helper.currentUser?.data?.image == null
                        ? const AssetImage(
                            'assets/images/profile2.png',
                          )
                        : NetworkImage(
                            (Helper.currentUser?.data?.image ?? ''),
                          ) as ImageProvider)
                    : FileImage(
                        pickedImage!,
                      ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () async {
                  ImagePickerDialog().show(
                      context: context,
                      onGet: (f) {
                        if (f != null) {
                          widget.onPicked(f);
                          setState(() {
                            pickedImage = f;
                          });
                        }
                        // changeData.image = f;
                      });
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 13,
                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
