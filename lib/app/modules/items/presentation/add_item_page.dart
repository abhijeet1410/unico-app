import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/utils/validators/app_validators.dart';
import 'package:flutter_template_3/app/core/widgets/alerts/alert_dialog.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_back_button.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_outline_button.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/core/widgets/photo_chooser.dart';
import 'package:flutter_template_3/app/modules/items/presentation/screen/items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/modules/items/presentation/screen/menu_screen.dart';
import 'package:flutter_template_3/app/modules/items/presentation/widgets/filled_tab_indicator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddItemsPage extends StatefulWidget {
  static const String routeName = '/add-item';
  const AddItemsPage({Key? key}) : super(key: key);

  @override
  State<AddItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<AddItemsPage> {
  dynamic initialData;

  File? image;
  String? name, description;
  List variants = ["11"]; // need to be change after data model
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    final map = Get.arguments as Map<String, dynamic>?;
    initialData = map?["data"];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle titleStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      initialData == null ? "Add item" : "Edit Item",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      initialData == null
                          ? "You can add an item by providing information about the item in the below list."
                          : "You can edit an item’s information directly by tapping on the fields.",
                      style: const TextStyle(color: Color(0xff4D4D4D)),
                    ),
                    const SizedBox(height: 18),
                    GestureDetector(
                      onTap: onChoosePhoto,
                      child: SizedBox.square(
                        dimension: 80,
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          color: const Color(0xffFFEACC),
                          child: Stack(
                            children: [
                              if (initialData != null)
                                Positioned.fill(
                                  child: Image.network(
                                      "https://images.pexels.com/photos/15469650/pexels-photo-15469650/free-photo-of-monochroom-winterlandschap.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                                      fit: BoxFit.cover),
                                ),
                              if (image != null)
                                Positioned.fill(
                                  child: Image.file(image!, fit: BoxFit.cover),
                                ),
                              if (initialData != null && image != null)
                                Positioned.fill(
                                    child: ColoredBox(
                                  color: Colors.black12,
                                )),
                              Center(
                                child: SvgPicture.asset(
                                  AppAssets.image,
                                  colorFilter: ColorFilter.mode(
                                      initialData == null
                                          ? theme.primaryColor
                                          : Colors.black,
                                      BlendMode.srcIn),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      initialData == null
                          ? "Add item image"
                          : "Edit item image",
                      style: titleStyle,
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      decoration:
                          AppDecorations.textFieldDecoration(context).copyWith(
                        labelText: "Name of item",
                        hintText: "Enter name of the item",
                      ),
                      textCapitalization: TextCapitalization.words,
                      onSaved: (v) {
                        name = v?.trim();
                      },
                      validator: AppFormValidators.validateEmpty,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration:
                          AppDecorations.textFieldDecoration(context).copyWith(
                        labelText: "Description",
                        hintText: "Write description for the item",
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      onSaved: (v) {
                        description = v?.trim();
                      },
                      validator: AppFormValidators.validateEmpty,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Add item variant (in qty, weight, portion size, etc)",
                      style: titleStyle,
                    ),
                    const SizedBox(height: 16),
                    ...variants
                        .map((e) => Padding(
                              padding: e == variants.last
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration:
                                          AppDecorations.textFieldDecoration(
                                                  context)
                                              .copyWith(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 12),
                                        labelText: "Variant name",
                                      ),
                                      onSaved: (v) {},
                                      validator:
                                          AppFormValidators.validateEmpty,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            decoration: AppDecorations
                                                    .textFieldDecoration(
                                                        context)
                                                .copyWith(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 12),
                                              labelText: "Enter price (₹)",
                                            ),
                                            onSaved: (v) {},
                                            keyboardType: TextInputType.number,
                                            validator: AppFormValidators
                                                .validateAmount,
                                          ),
                                        ),
                                        if (e != variants.first) ...[
                                          const SizedBox(width: 16),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 12),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    variants.remove(e);
                                                  });
                                                },
                                                child: SvgPicture.asset(
                                                    AppAssets.delete)),
                                          )
                                        ]
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: theme.primaryColor),
                        onPressed: () {
                          setState(() {
                            variants.add("1${variants.length}");
                          });
                        },
                        child: Text("+ Add another"))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    padding: EdgeInsets.all(14),
                    child: Text("Delete item"),
                    color: Colors.black,
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    onPressed: deleteItem,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppPrimaryButton(
                    padding: EdgeInsets.zero,
                    child: Text("Add item"),
                    onPressed: validateForm,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onChoosePhoto() {
    Get.bottomSheet(
            PhotoChooser(aspectRatioPresets: [CropAspectRatioPreset.square]),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            backgroundColor: Colors.white)
        .then((value) {
      if (value != null) {
        print("HEHE $value");
        setState(() {
          image = value;
        });
      }
    });
  }

  void validateForm() {
    final state = formKey.currentState;
    if (state == null) return;
    if (state.validate()) {
      state.save();
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  void deleteItem() {
    showAppAlertDialog(
            title: "Are you sure to delete the item.",
            description: "You can’t undo this action.",
            positiveText: "Delete",
            negativeText: "Cancel")
        .then((value) {
      print(value);
    });
  }
}
