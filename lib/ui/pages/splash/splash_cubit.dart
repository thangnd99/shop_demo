
import 'package:shop_demo_app/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../router/route_config.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository authRepo;

  SplashCubit({
    required this.authRepo,
  }) : super(const SplashState());

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    await Get.offAllNamed(RouteConfig.main);
  }
}
