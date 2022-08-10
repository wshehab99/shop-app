import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
}
