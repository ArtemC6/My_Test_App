class CodeItemModel {
  String id;
  String text;
  String icon;
  String colorBackground;
  String iconColor;

  CodeItemModel({
    required this.id,
    required this.text,
    required this.icon,
    required this.colorBackground,
    required this.iconColor,
  });

  factory CodeItemModel.fromJson(Map<String, dynamic> json) {
    return CodeItemModel(
      id: json['id'],
      text: json['text'],
      icon: json['icon'],
      colorBackground: json['colorBackground'],
      iconColor: json['iconColor'],
    );
  }
}
