import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_demo_app/common/app_text_styles.dart';
import 'package:shop_demo_app/models/entities/product/product_entity.dart';
import 'package:shop_demo_app/ui/pages/detail_product/detail_product_cubit.dart';
import 'package:shop_demo_app/ui/pages/detail_product/widget/delegate_sliver_header.dart';
import 'package:shop_demo_app/ui/widgets/buttons/app_button.dart';
import 'package:shop_demo_app/ui/widgets/images/app_cache_image.dart';

class DetailProductArgument {
  final ProductEntity productEntity;

  const DetailProductArgument({
    required this.productEntity,
  });
}

class DetailProductPage extends StatelessWidget {
  final DetailProductArgument argument;

  const DetailProductPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return DetailProductCubit();
      },
      child: _DetailProductChildPage(
        argument: argument,
      ),
    );
  }
}

class _DetailProductChildPage extends StatefulWidget {
  final DetailProductArgument argument;

  const _DetailProductChildPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  _DetailProductChildPageState createState() => _DetailProductChildPageState();
}

class _DetailProductChildPageState extends State<_DetailProductChildPage>
    with AutomaticKeepAliveClientMixin {
  late DetailProductCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<DetailProductCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: DelegateSliverHeader(
                height: size.height / 3,
                widget: AppCacheImage(
                  url: widget.argument.productEntity.image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          widget.argument.productEntity.title ?? '',
                          style: AppTextStyle.blackS24Bold,
                        ),const SizedBox(height: 10),
                        Text(
                          widget.argument.productEntity.description ?? '',
                          style: AppTextStyle.blackS18,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            Text(
                              '${widget.argument.productEntity.rate?.rate ?? 0.0}',
                              style: AppTextStyle.blackS24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$ ${widget.argument.productEntity.price ?? 0.0}',
                          style: AppTextStyle.blackS24,
                        ),
                        const SizedBox(height: 20),
                        AppButton(
                          backgroundColor: Colors.blue,
                          leadingIcon: const Icon(Icons.add),
                          title: 'Add to card',
                          cornerRadius: 20,
                          textStyle: AppTextStyle.whiteS16Bold,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
