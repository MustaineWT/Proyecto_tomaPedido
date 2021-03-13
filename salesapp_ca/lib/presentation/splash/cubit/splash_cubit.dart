import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/repositories/local/local_auth_repository.dart';

enum SplashState { none, existing_user }

class SplashCubit extends Cubit<SplashState> {
  final LocalAuthRepository _localAuthRepository;
  SplashCubit(this._localAuthRepository) : super(SplashState.none);

  void init() async {
    await Future.delayed(Duration(seconds: 4));
    bool values = await _localAuthRepository.getSession();

    if (values) {
      emit(SplashState.existing_user);
    } else {
      emit(SplashState.none);
    }
  }
}
