class DataModel {
  final String title;
  final  String description;


  DataModel({ required this.title, required this.description});

  factory DataModel.fromMap(Map<String,dynamic> json){
    return DataModel(
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "title" : title,
      "description": description,

    };
}

}