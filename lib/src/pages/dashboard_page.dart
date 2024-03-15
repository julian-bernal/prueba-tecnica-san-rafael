import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dashboard_bloc.dart';
import '../blocs/dashboard_event.dart';
import '../blocs/dashboard_state.dart';
import '../services/dashboard_services.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DashboardServices>(
      create: (context) => DashboardServices(),
      child: BlocProvider<DashboardBloc>(
        create: (context) => DashboardBloc(
          RepositoryProvider.of<DashboardServices>(context))..add(LoadDashboardEvent()
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Prueba Técnica clinica San Rafael'),
          ),
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DashboardLoadedState) {
                return ListView.builder(
                  itemCount: state.dashboardItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.dashboardItems[index].title),
                      subtitle: Text(state.dashboardItems[index].icon),
                    );
                  },
                );
              }

              if (state is DashboardErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }

              return const Center(
                child: Text('Something went wrong!'),
              );
            },
          ),
        ),
      ),
    );

  }
}