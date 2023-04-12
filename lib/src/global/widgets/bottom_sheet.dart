//
import 'package:flutter/material.dart';

Future<dynamic> bottomSheet(BuildContext context, filePicker) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 8, right: 8),
              child: Text(
                "Please insert a picture to help you visualize your goal in your vision board.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color:
                      Color(0xffDEB988), // this is for your text colour
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14.0, left: 8, bottom: 0),
              child: Text(
                "Insert Image From",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff2E2E2E), // this is for your text colour
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: 8,
              ),
              horizontalTitleGap: 6,
              leading: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.black,
              ),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 8),
              horizontalTitleGap: 6,
              leading: Image.asset(
                "assets/images/upload_image_icon.png",
                color: Colors.black,
                height: 24,
              ),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 8),
              horizontalTitleGap: 6,
              leading: const Icon(
                Icons.cloud_upload_rounded,
                color: Colors.black,
              ),
              title: const Text('Cloud Links'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
