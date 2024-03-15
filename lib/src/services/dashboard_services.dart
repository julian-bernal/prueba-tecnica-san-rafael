import 'package:http/http.dart' as http;

import '../constants/service_routes.dart';
import '../models/dashboard_models.dart';

class DashboardServices {
  
  Future<List<DashboardItems>> getDashboardData() async {
    try {
      final response = await http.get(
        Uri.parse('${ServiceRoutes.routeApi}dashboard'),
      );

      if (response.statusCode == 200) 
      {
        final Dashboard dashboardData = dashboardFromJson(response.body);

        if (dashboardData.status) {
          return dashboardData.data;
        } 
          
        throw Exception(dashboardData.message);
    
      } 
        
      throw Exception('Failed to load dashboard data: ${response.body}');
      
    } catch (e) {
      throw Exception('Failed to load dashboard data');
    }
  }

}