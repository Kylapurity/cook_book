class Recipe {
  final String name;
  final String image;
  final List ingredientsList;
  final List instructionsList;
  final List ingredientsMeasure;
  bool isFavourite;

  Recipe({
    required this.ingredientsMeasure,
    required this.name,
    required this.image,
    required this.ingredientsList,
    required this.instructionsList,
    required this.isFavourite,
  });

  factory Recipe.fromJson(json) {
    // getting the instructions, cleaning the list recieved as much as possible
    final instructionsList = cleanInstructions(json);

    // putting the ingredients recieved from the API in a list
    final ingredientsList = recieveIngredients(json);

    // putting the ingredients measure recieved from the API in a list
    final ingredientsMeasure = recieveMeasures(json);

    return Recipe(
      name: json['strMeal'] as String,
      image: json['strMealThumb'] as String,
      ingredientsMeasure: ingredientsMeasure,
      ingredientsList: ingredientsList,
      instructionsList: instructionsList,
      isFavourite: false,
    );
  }

  static cleanInstructions(json) {
    RegExp stepRegex = RegExp(r'(\b((STEP) \d+)+\b)', caseSensitive: false);

    final instructionsList = json['strInstructions']
        .toString()
        .replaceAll(stepRegex, '')
        .replaceAll('\r\n', ' ')
        .replaceAll('. (', '. ')
        .replaceAll('.) ', '. ')
        .split('.');

    instructionsList.removeWhere((element) => element.isEmpty);
    instructionsList.removeWhere((element) => double.tryParse(element) != null);

    return instructionsList;
  }

  static recieveIngredients(json) {
    final ingredientsList = [];
    int index = 1;

    while (json['strIngredient$index'] != '' &&
        json['strIngredient$index'] != null) {
      ingredientsList.add(json['strIngredient$index']);
      index++;
    }

    return ingredientsList;
  }

  static recieveMeasures(json) {
    final ingredientsMeasure = [];
    int index = 1;

    while (json['strMeasure$index'] != '' && json['strMeasure$index'] != null) {
      ingredientsMeasure.add(json['strMeasure$index']);
      index++;
    }

    return ingredientsMeasure;
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $image}';
  }
}
