import 'package:flutter/material.dart';
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
          RepositoryProvider.of<DashboardServices>(context))..add(LoadDashboardEvent()
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xff582C5F),
            title: const Text('San Rafael Contigo', 
              style: TextStyle( 
                color: Colors.white, fontSize: 20, 
                fontWeight: FontWeight.bold, 
                fontFamily: 'Lobster'
              ),
            ),
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
                    Container(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Totorial',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Institucional',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Dos iconos por fila
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.dashboardItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Logo dentro del botón
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
                                  backgroundColor: Color(0xff582C5F)
                                ),
                              ),
                              SizedBox(height: 10), // Espacio entre el botón y el texto
                              // Texto debajo del botón
                              Text(
                                state.dashboardItems[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
        ),
      ),
    );

  }
}