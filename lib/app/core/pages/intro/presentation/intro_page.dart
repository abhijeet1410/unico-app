import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/pages/intro/models/intro_options.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AppIntroPage extends StatefulWidget {
  final Widget? titleLogo;
  final Widget? titleAction;
  final int initialPage;
  final Function(int)? onPageChange;
  final List<AppIntroSliderData> introData;
  final CarouselController? sliderController;
  final Widget Function(AppIntroSliderData)? introWidgetBuilder;
  final String incompleteButtonLabel;
  final String completedButtonLabel;
  const AppIntroPage({
    this.introWidgetBuilder,
    this.initialPage = 0,
    this.titleLogo,
    this.sliderController,
    this.titleAction,
    this.onPageChange,
    required this.introData,
    super.key,
    this.incompleteButtonLabel = "Next",
    this.completedButtonLabel = "Get started",
  });

  @override
  State<AppIntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<AppIntroPage> {
  late CarouselController sliderController;
  late int currentPage;
  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage ?? 0;
    sliderController = widget.sliderController ?? CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: widget.titleAction,
      body: Column(
        children: [
          if (widget.titleLogo != null) SafeArea(child: widget.titleLogo!),
          Expanded(
              child: CarouselSlider(
                  carouselController: sliderController,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: double.infinity,
                      initialPage: widget.initialPage,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      // aspectRatio: 16 / 12,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (page, reason) {
                        setState(() {
                          currentPage = page;
                        });
                        widget.onPageChange?.call(page);
                      }),
                  items: widget.introData
                      .map((AppIntroSliderData e) =>
                          widget.introWidgetBuilder?.call(e) ??
                          Column(
                            children: [
                              Expanded(child: e.asset),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Image.asset(data[index]['image'],
                                  //     fit: BoxFit.cover),
                                  if (e.title != null)
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        e.title ?? "",
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  if (e.description != null)
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        e.description ?? "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                ],
                              ),
                            ],
                          ))
                      .toList())),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  widget.introData.length, (int index) => _dotBuilder(index))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: AppPrimaryButton(
              width: Get.width,
              child: Text(currentPage == widget.introData.length - 1
                  ? widget.completedButtonLabel
                  : widget.incompleteButtonLabel),
              onPressed: () {
                if (currentPage == widget.introData.length - 1) {
                  //
                  widget.onPageChange?.call(widget.introData.length);
                } else {
                  sliderController.nextPage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _dotBuilder(int index) {
    bool selected = index == currentPage;
    return CircleAvatar(
        radius: selected ? 5 : 3.5,
        backgroundColor: selected ? Get.theme.primaryColor : Colors.white);
  }
}
