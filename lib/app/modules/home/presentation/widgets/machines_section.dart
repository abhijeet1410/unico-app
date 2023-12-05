import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unico_app/app/core/asset/resources.dart';
import 'package:unico_app/app/core/theme/app_colors.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_outline_button.dart';
import 'package:unico_app/app/core/widgets/user_circle_avatar.dart';
import 'package:unico_app/app/modules/home/presentation/widgets/add_items_sheet.dart';
import 'package:get/get.dart';

///
/// Created by Kumar Sunil on 27-11-2023
///
class HomeMachinesSection extends StatelessWidget {
  const HomeMachinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              "VIEW DATA FOR",
              style: TextStyle(
                color: Color(0xff6C6C6C),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppOutlineButton(
                child: Row(
              children: [
                Spacer(),
                Text(
                  "All machines",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 14),
                SvgPicture.asset(AppAssets.arrowDown),
                Spacer(),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              "5 Slots are empty",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return MachinesSlotsTile();
            },
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}

class MachinesSlotsTile extends StatelessWidget {
  const MachinesSlotsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Material(
        color: const Color(0xffF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserCircleAvatar(
                    "https://images.pexels.com/photos/3714786/pexels-photo-3714786.jpeg?auto=compress&cs=tinysrgb&w=600",
                    radius: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    placeholder: const ImagePlaceholder(
                      width: 28,
                      height: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BMC Mall Machine",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 12),
                      ),
                      Text(
                        "2 Empty slots",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                    child: Text(
                      "Patia, Bhubaneswar",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Color(0xff373737), fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SlotTile(),
                    SlotTile(),
                    SlotTile(),
                    SlotTile(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlotTile extends StatelessWidget {
  const SlotTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        clipBehavior: Clip.none,
        color: Color(0xff434D56),
        child: InkWell(
          onTap: () {
            Get.bottomSheet(
              AddItemsSheet(),
              isScrollControlled: true,
              ignoreSafeArea: false,
            );
          },
          child: SizedBox(
            width: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Slot: 4",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Butter Naan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(AppAssets.arrowNext),
                  const SizedBox(width: 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
