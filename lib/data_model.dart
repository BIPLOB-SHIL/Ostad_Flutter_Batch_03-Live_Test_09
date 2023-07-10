class DataModel {
  DataModel({
      this.recipes,});

  DataModel.fromJson(dynamic json) {
    if (json['recipes'] != null) {
      recipes = [];
      json['recipes'].forEach((v) {
        recipes?.add(Recipes.fromJson(v));
      });
    }
  }
  List<Recipes>? recipes;
DataModel copyWith({  List<Recipes>? recipes,
}) => DataModel(  recipes: recipes ?? this.recipes,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (recipes != null) {
      map['recipes'] = recipes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Recipes {
  Recipes({
      this.title, 
      this.description, 
      this.ingredients,});

  Recipes.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    ingredients = json['ingredients'] != null ? json['ingredients'].cast<String>() : [];
  }
  String? title;
  String? description;
  List<String>? ingredients;
Recipes copyWith({  String? title,
  String? description,
  List<String>? ingredients,
}) => Recipes(  title: title ?? this.title,
  description: description ?? this.description,
  ingredients: ingredients ?? this.ingredients,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['ingredients'] = ingredients;
    return map;
  }

}