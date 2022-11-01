import 'package:flutter/material.dart';
import 'package:shop_demo_app/blocs/app_cubit.dart';
import 'package:shop_demo_app/ui/pages/main/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (BuildContext context) => MainCubit(),
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
  ///PageView page
  late List<Widget> pageList;
  late PageController pageController;

  late MainCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<MainCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
