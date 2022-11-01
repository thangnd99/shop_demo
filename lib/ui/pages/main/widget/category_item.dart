import 'package:flutter/material.dart';
import 'package:shop_demo_app/common/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    this.name = '',
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);
  final VoidCallback? onTap;
  final bool isSelected;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          name,
          style: isSelected
              ? AppTextStyle.whiteS14Bold
              : AppTextStyle.blackS14Bold.copyWith(
                  color: Colors.blue,
                ),
        ),
      ),
    );
  }
}
