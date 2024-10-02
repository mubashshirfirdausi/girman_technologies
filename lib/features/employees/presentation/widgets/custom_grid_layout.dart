import 'package:flutter/material.dart';

class CustomGridLayout extends StatelessWidget {
  const CustomGridLayout({
    super.key,
    required this.itemCount,
    this.crossAxisCount = 1,
    required this.builder,
  });

  final int itemCount;
  final int crossAxisCount;
  final NullableIndexedWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          (itemCount / crossAxisCount).ceil(),
          (rowIndex) {
            return Row(
              children: List.generate(
                crossAxisCount,
                (columnIndex) {
                  final index = rowIndex * crossAxisCount + columnIndex;
                  return Expanded(
                    child: index < itemCount ? builder(context, index)! : const SizedBox.shrink(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
