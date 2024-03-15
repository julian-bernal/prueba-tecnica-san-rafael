import '../models/dashboard_models.dart';

abstract class DashboardState {}
  
class DashboardLoadingState extends DashboardState{}

class DashboardErrorState extends DashboardState{
  final String message;
  DashboardErrorState(this.message);
}

class DashboardLoadedState extends DashboardState{
  final List<DashboardItems> dashboardItems;
  DashboardLoadedState(this.dashboardItems);
}

