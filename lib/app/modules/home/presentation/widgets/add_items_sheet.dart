import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/theme/app_colors.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';
import 'package:flutter_template_3/app/core/utils/decorations/app_decorations.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/core/widgets/user_circle_avatar.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

///
/// Created by Kumar Sunil on 27-11-2023
///
class AddItemsSheet extends StatefulWidget {
  const AddItemsSheet({super.key});

  @override
  State<AddItemsSheet> createState() => _AddItemsSheetState();
}

class _AddItemsSheetState extends State<AddItemsSheet> {
  TextEditingController searchTextController = TextEditingController();
  String get searchQuery => searchTextController.text.trim();
  bool get isEmptySearch => searchQuery.isEmpty;
  @override
  void initState() {
    super.initState();
    searchTextController.addListener(_textChange);
  }

  _textChange() {
    setState(() {});
  }

  @override
  void dispose() {
    searchTextController
      ..removeListener(_textChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
        initialChildSize: .8,
        minChildSize: 0.6,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return SafeArea(
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(22)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "Select items to add",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                        CloseButton(
                          onPressed: () {
                            Get.back();
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: TextField(
                      controller: searchTextController,
                      decoration:
                          AppDecorations.textFieldDecoration(context).copyWith(
                              filled: false,
                              hintText: "Search item",
                              suffixIcon: isEmptySearch
                                  ? const Icon(Icons.search)
                                  : IconButton(
                                      onPressed: () {
                                        searchTextController.clear();
                                        FocusScope.of(context).unfocus();
                                      },
                                      icon: const Icon(Icons.close))),
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 16,
                    ),
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) => ProductItemsTile(),
                    itemCount: 15,
                  )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: AppPrimaryButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Add item to slot"),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class ProductItemsTile extends StatelessWidget {
  const ProductItemsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Stack(
              children: [
                UserCircleAvatar(
                  "https://images.pexels.com/photos/3714786/pexels-photo-3714786.jpeg?auto=compress&cs=tinysrgb&w=600",
                  radius: 32,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  placeholder: const ImagePlaceholder(
                    width: 64,
                    height: 64,
                  ),
                ),
                const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 24,
                    child: Material(
                      color: Color(0xff333333),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      )),
                      child: Center(
                          child: Text(
                        "Active",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                    ))
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aloo tikki burger",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14),
                ),
                Text(
                  "₹123",
                  style: TextStyle(
                    color: Color(0xff4D4D4D),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            )),
            SvgPicture.asset(AppAssets.tickSelected),
            // SvgPicture.asset(AppAssets.tickUnselected),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              VariantTile(title: "Var1", isSelected: true),
              const SizedBox(width: 16),
              VariantTile(title: "Var2", isSelected: false),
              const SizedBox(width: 16),
              VariantTile(title: "Var3", isSelected: false),
            ],
          ),
        )
      ],
    );
  }
}

class VariantTile extends StatelessWidget {
  const VariantTile(
      {this.onTap, required this.title, this.isSelected = false, super.key});
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? AppColors.green.shade600.withOpacity(0.3)
          : Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 1.2,
            color: isSelected ? AppColors.green.shade600 : Colors.black,
          )),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.green.shade600 : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
