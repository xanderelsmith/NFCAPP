import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final Color selectedColor;
  final bool enableFeedback;
  final Function(int index) onTap;
  final TextStyle? selectedLabelStyle;
  const CustomBottomNavigationBar(
      {super.key,
      required this.onTap,
      required this.enableFeedback,
      required this.items,
      required this.currentIndex,
      this.selectedLabelStyle,
      required this.selectedColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) => GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  items[index].icon,
                  if (items[index].label != null)
                    Text(
                      items[index].label!,
                      style: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedLabelStyle,
                    ),
                  if (currentIndex == index)
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: selectedColor,
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
