import 'package:flutter/material.dart';

/// Enum to define scroll direction.
enum ScrollDirection { horizontal, vertical }

/// A widget that displays a list of items with dynamic heights in a scrollable view.
class DynamicHeightListView<T> extends StatelessWidget {
  /// Padding for the entire list view.
  final EdgeInsets? padding;

  /// Padding for each individual item.
  final EdgeInsets itemPadding;

  /// List of items to be displayed.
  final List<T> items;

  /// Builder function to create widgets for each item.
  final Widget Function(BuildContext context, T item) itemBuilder;

  /// Optional controller for the scroll view.
  final ScrollController? controller;

  /// Scroll direction of the list view.
  final ScrollDirection scrollDirection;

  /// Optional physics for the scroll view.
  final ScrollPhysics? physics;

  /// Creates a [DynamicHeightListView] widget.
  const DynamicHeightListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.padding,
    this.itemPadding = const EdgeInsets.only(right: 20.0),
    this.controller,
    this.scrollDirection = ScrollDirection.horizontal,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    final cards = <Widget>[];

    if (items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        cards.add(Padding(
          padding: itemPadding,
          child: itemBuilder(context, items[i]),
        ));
      }

      return SingleChildScrollView(
        controller: controller,
        padding: padding,
        physics: physics,
        scrollDirection: scrollDirection == ScrollDirection.horizontal
            ? Axis.horizontal
            : Axis.vertical,
        child: scrollDirection == ScrollDirection.horizontal
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cards,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cards,
              ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
