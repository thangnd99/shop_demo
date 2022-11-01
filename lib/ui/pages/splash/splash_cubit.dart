import 'package:dio/dio.dart';
import 'package:shop_demo_app/repositories/auth_repository.dart';
import 'package:shop_demo_app/ui/commons/app_dialog.dart';
import 'package:shop_demo_app/ui/pages/main/main_page.dart';
import 'package:shop_demo_app/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../repositories/user_repository.dart';
import '../../../router/route_config.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository authRepo;
  final UserRepository userRepo;

  SplashCubit({
    required this.authRepo,
    required this.userRepo,
  }) : super(const SplashState());

  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    await Get.offAllNamed(RouteConfig.main);
  }
}
