import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/core/pages/grid/presentation/widgets/grid_page_header.dart';
import 'package:flutter_template_3/app/core/pages/splash/models/splash_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_empty_widget.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_error_widget.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_loader.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

enum GridPageState { loading, loaded, error }

typedef GridItemBuilder<T> = Widget Function(
    BuildContext context, T data, int index);

class GridPage<T> extends StatefulWidget {
  final ScrollController? scrollController;
  final List<T> data;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final GridPageState currentState;
  final GridItemBuilder<T> itemBuilder;
  final Function? onLoadMore;
  final int crossAxisCount;
  final bool shouldLoadMore;
  final RefreshCallback? onRefresh;

  final Widget? toolbarTitle;
  final List<Widget> toolbarAction;
  final double? toolbarMaxHeight;
  final double? toolbarMinHeight;
  final double loadMoreThreshold;
  final double? gridTileRatio;
  final double? gridSpacing;
  final EdgeInsets? gridPadding;
  final Widget Function(BuildContext context, double percent)?
      sliverAppBarBuilder;

  const GridPage(
      {super.key,
      this.toolbarMaxHeight,
      this.loadMoreThreshold = 0,
      this.gridTileRatio,
      this.toolbarMinHeight,
      this.sliverAppBarBuilder,
      this.onRefresh,
      this.toolbarTitle,
      this.toolbarAction = const <Widget>[],
      this.scrollController,
      this.data = const [],
      required this.itemBuilder,
      this.errorWidget,
      this.loadingWidget,
      this.onLoadMore,
      this.emptyWidget,
      this.shouldLoadMore = false,
      this.crossAxisCount = 2,
      this.currentState = GridPageState.loading,
      this.gridSpacing,
      this.gridPadding});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = (widget.scrollController ?? ScrollController())
      ..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    final double current = scrollController.position.pixels;
    final double max = scrollController.position.maxScrollExtent;
    if (max - current <= widget.loadMoreThreshold) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget loadingWidget =
        widget.loadingWidget ?? const Center(child: AppProgress());
    final Widget errorWidget = widget.errorWidget ??
        const AppErrorWidget(title: "Some error occurred");
    final Widget emptyWidget =
        widget.errorWidget ?? const AppEmptyWidget(title: "No data found");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
          onRefresh: widget.onRefresh ?? () async {},
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            slivers: [
              if (widget.sliverAppBarBuilder != null)
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: GridPageHeader(
                      maxHeight: widget.toolbarMaxHeight ?? 200,
                      minHeight: widget.toolbarMinHeight ?? kToolbarHeight,
                      builder: widget.sliverAppBarBuilder),
                )
              else if (widget.toolbarTitle != null)
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  title: widget.toolbarTitle,
                  actions: widget.toolbarAction,
                ),
              SliverToBoxAdapter(
                  child: Builder(builder: (BuildContext context) {
                if (widget.currentState == GridPageState.loading) {
                  return loadingWidget;
                }
                if (widget.currentState == GridPageState.error) {
                  return errorWidget;
                }
                if (widget.data.isEmpty) {
                  return emptyWidget;
                }
                if (widget.currentState == GridPageState.loaded) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: widget.gridPadding,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: widget.crossAxisCount,
                          mainAxisSpacing: widget.gridSpacing ?? 0,
                          crossAxisSpacing: widget.gridSpacing ?? 0,
                          childAspectRatio: widget.gridTileRatio ?? 1),
                      itemCount: widget.shouldLoadMore
                          ? widget.data.length + 1
                          : widget.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= widget.data.length) {
                          return const Center(child: AppProgress());
                        }
                        return widget.itemBuilder(
                            context, widget.data[index], index);
                      });
                }
                return emptyWidget;
              })),
            ],
          ),
        ));
  }
}
