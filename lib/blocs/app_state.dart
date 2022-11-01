part of 'app_cubit.dart';

class AppState extends Equatable {
  final LoadStatus fetchProfileStatus;
  final LoadStatus signOutStatus;

  const AppState({
    this.fetchProfileStatus = LoadStatus.initial,
    this.signOutStatus = LoadStatus.initial,
  });

  AppState copyWith({
    LoadStatus? fetchProfileStatus,
    LoadStatus? signOutStatus,
  }) {
    return AppState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
      signOutStatus: signOutStatus ?? this.signOutStatus,
    );
  }

  AppState removeUser() {
    return AppState(
      fetchProfileStatus: fetchProfileStatus,
      signOutStatus: signOutStatus,
    );
  }

  @override
  List<Object?> get props => [
        fetchProfileStatus,
        signOutStatus,
      ];
}
