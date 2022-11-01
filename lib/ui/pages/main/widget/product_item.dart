import 'package:flutter/material.dart';
import 'package:shop_demo_app/common/app_text_styles.dart';
import 'package:shop_demo_app/models/entities/product/product_entity.dart';
import 'package:shop_demo_app/ui/widgets/images/app_cache_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    this.onTap,
    this.onAddItem,
  }) : super(key: key);

  final ProductEntity product;
  final VoidCallback? onTap;
  final VoidCallback? onAddItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AppCacheImage(
                url: product.image ?? '',
                fit: BoxFit.cover,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title ?? '',
              style: AppTextStyle.blackS14Bold,
              maxLines: 4,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '\$${product.price ?? 0.0}',
                    style: AppTextStyle.blackS14Bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: onAddItem,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
