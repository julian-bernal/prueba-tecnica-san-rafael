import 'package:flutter/material.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
          RepositoryProvider.of<DashboardServices>(context))..add(
            LoadDashboardEvent()
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('San Rafael Contigo'),
          ),
          body: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DashboardLoadedState) {
              
                return Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Tutorial',
                              style: TextStyle(
                                color:  Colors.white,
                                fontSize: 25,
                              ),
                            ),
                            // const SizedBox(height: 1),
                            const Text(
                              'Institucional',
                              style: TextStyle(
                                color:  Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(13.5),
                        )
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: 
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Dos iconos por fila
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.dashboardItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Acción cuando se presiona el botón
                                },
                                child:  SvgPicture.network(
                                  color: Colors.white,
                                  //dar mayor grosor a los iconos
                                  state.dashboardItems[index].icon,
                                  width: 75,
                                  height: 75,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(), // Forma circular para el botón
                                  padding: EdgeInsets.all(16), // Espaciado interno
                                  backgroundColor: Theme.of(context).colorScheme.primary
                                ),
                              ),
                              SizedBox(height: 10), // Espacio entre el botón y el texto
                              // Texto debajo del botón
                              Text(
                                state.dashboardItems[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }

              if (state is DashboardErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }

              return const Center(
                child: Text('Sin datos para mostrar'),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ThemeMode? themeMode = EasyDynamicTheme.of(context).themeMode;

              print('theme: $themeMode');

              if (themeMode == ThemeMode.system || themeMode == ThemeMode.light) 
              {
                return EasyDynamicTheme.of(context).changeTheme(dark: true);
              }

              EasyDynamicTheme.of(context).changeTheme(dark: false);
            },
            child: const Icon(Icons.sunny),
          ),
        ),
      ),
    );

  }
}