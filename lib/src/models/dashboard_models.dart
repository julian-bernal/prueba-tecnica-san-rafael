import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  bool status;
  String message;
  List<DashboardItems> data;

  Dashboard({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    status: json["status"],
    message: json["message"],
    data: List<DashboardItems>.from(json["data"].map(
      (x) => DashboardItems.fromJson(x))
    ),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DashboardItems {
  String title;
  String icon;

  DashboardItems({
    required this.title,
    required this.icon,
  });

  factory DashboardItems.fromJson(Map<String, dynamic> json) => 
  DashboardItems(
    title: json["title"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "icon": icon,
  };
}
