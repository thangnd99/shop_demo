import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_demo_app/models/enums/load_status.dart';
import 'package:shop_demo_app/repositories/product_repository.dart';
import 'package:shop_demo_app/router/route_config.dart';
import 'package:shop_demo_app/ui/pages/detail_product/detail_product_page.dart';
import 'package:shop_demo_app/ui/pages/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_demo_app/ui/pages/main/main_state.dart';
import 'package:shop_demo_app/ui/pages/main/widget/category_item.dart';
import 'package:shop_demo_app/ui/pages/main/widget/product_item.dart';
import 'package:shop_demo_app/ui/widgets/app_circular_progress_indicator.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (BuildContext context) {
        final productRepo = RepositoryProvider.of<ProductRepository>(context);
        return MainCubit(productRepository: productRepo);
      },
      child: const _MainPage(),
    );
  }
}

class _MainPage extends StatefulWidget {
  const _MainPage({Key? key}) : super(key: key);

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  late MainCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<MainCubit>(context);
    initialData();
    super.initState();
  }

  void initialData() {
    _cubit.getAllCategory();
    _cubit.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fake API store',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 5),
            BlocBuilder<MainCubit, MainState>(
              buildWhen: (pre, cur) {
                return pre.loadCategoriesStatus != cur.loadCategoriesStatus ||
                    pre.categorySelected != cur.categorySelected;
              },
              builder: (context, state) {
                return Container(
                  height: 40,
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        name: state.categories[index],
                        isSelected: index == state.categorySelected,
                        onTap: () {
                          _cubit.onChangedCategory(index);
                        },
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            Expanded(
              child: BlocBuilder<MainCubit, MainState>(
                buildWhen: (pre, cur) {
                  return pre.loadAllProductStatus != cur.loadAllProductStatus;
                },
                builder: (context, state) {
                  return state.loadAllProductStatus == LoadStatus.loading
                      ? const Center(
                          child: AppCircularProgressIndicator(),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(
                              product: state.products[index],
                              onTap: () {
                                Get.toNamed(
                                  RouteConfig.detailProduct,
                                  arguments: DetailProductArgument(
                                    productEntity: state.products[index],
                                  ),
                                );
                              },
                            );
                          },
                          itemCount: state.products.length,
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
