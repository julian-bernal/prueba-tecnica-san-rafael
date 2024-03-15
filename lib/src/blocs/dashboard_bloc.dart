import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/dashboard_services.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardServices _dashboardRepository;

  DashboardBloc(this._dashboardRepository) : super(DashboardLoadingState()) {
    on<LoadDashboardEvent>((event, emit) async {
      emit(DashboardLoadingState());
      try {
        final dashboardItems = await _dashboardRepository.getDashboardData();
        print('Aca dashboardItems: ' + dashboardItems.toString());
        emit(DashboardLoadedState(dashboardItems));
      } catch (e) {
        emit(DashboardErrorState(e.toString()));
      }
    });
  }


}
