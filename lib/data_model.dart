class DataModel {
  late String title;
  late  String description;
  late  List<String> ingredients;

  DataModel(this.title, this.description, this.ingredients);

  DataModel.fromJson(Map<String,dynamic> json)
  {
    title = json['title'];
    description =json['description'];
    ingredients = json['ingredients'];
  }

  Map<String,dynamic> toMap(){
    return {
      "title" : title,
      "description": description,
      "ingredients": ingredients,

    };
}

}