import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unico_app/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class PhotoChooser extends StatelessWidget {
  final String? title;
  final CropStyle? cropStyle;
  final List<CropAspectRatioPreset>? aspectRatioPresets;

  const PhotoChooser(
      {this.title, this.cropStyle, this.aspectRatioPresets, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 22,
          ),
          Text(
            title ?? 'Choose from a source',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          DefaultTextStyle(
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _chooseImage(ImageSource.camera, context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.camera,
                          size: 32,
                        ),
                        Text('Camera')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 38,
                ),
                GestureDetector(
                  onTap: () => _chooseImage(ImageSource.gallery, context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.photo_library_rounded,
                          size: 32,
                        ),
                        Text('Gallery')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 0, color: Colors.grey),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }

  _chooseImage(ImageSource source, BuildContext context) {
    ImagePicker()
        .pickImage(
      source: source,
    )
        .then((file) {
      if (file != null && file.path.isNotEmpty) {
        ImageCropper().cropImage(
          sourcePath: file.path,
          maxWidth: 500,
          maxHeight: 500,
          cropStyle: cropStyle ?? CropStyle.rectangle,
          aspectRatioPresets: aspectRatioPresets ??
              const [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ],
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Your Image',
              toolbarColor: Get.theme.primaryColor,
              toolbarWidgetColor: Colors.white,
              // initAspectRatio: CropAspectRatioPreset.square,
              // lockAspectRatio: true,
            ),
            IOSUiSettings(
                minimumAspectRatio: 1.0,
                title: 'Crop Your Image',
                aspectRatioLockEnabled: true,
                showCancelConfirmationDialog: true),
          ],
        ).then((CroppedFile? value) {
          if (value != null && value.path.isNotEmpty) {
            Navigator.pop(context, File(value.path));
          }
        });
      }
    }).catchError((error) {
      AppSnackBarUtil.show('Please allow permission to upload image.');
    });
  }
}
