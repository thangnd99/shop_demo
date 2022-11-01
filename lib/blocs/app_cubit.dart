import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/enums/load_status.dart';
import '../repositories/auth_repository.dart';
import '../utils/logger.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AuthRepository authRepo;

  AppCubit({
    required this.authRepo,
  }) : super(const AppState());

  void fetchProfile() {
    emit(state.copyWith(fetchProfileStatus: LoadStatus.loading));
  }

  ///Sign Out
  void signOut() async {
    emit(state.copyWith(signOutStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      await authRepo.removeToken();
      emit(state.removeUser().copyWith(
            signOutStatus: LoadStatus.success,
          ));
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(signOutStatus: LoadStatus.failure));
    }
  }
}
