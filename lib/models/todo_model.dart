class TodoModel {
  String title;
  bool isDone;
  String id;
  String description;
  DateTime createdTime;

  TodoModel(
      {required this.id,
      required this.title,
      required this.isDone,
      required this.description,
      required this.createdTime});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        title: json['title'],
        isDone: json['isDone'],
        description: json['description'],
        createdTime: json['createdTime'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
        'description': description,
        'createdTime': createdTime
      };
}
