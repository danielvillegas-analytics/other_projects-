class RecipeOrganizer:
    def __init__(self):
        self.recipes = {}

    def add_recipe(self, recipe_name, recipe_ingredients):
        self.recipes[recipe_name] = recipe_ingredients
        print('Recipe added successfully.')

    def list_recipes(self):
        if not self.recipes:
            print('No recipes found.')
            return
        
        print('Recipes:')
        for recipe_name, recipe_ingredients in self.recipes.items():
            print(f'{recipe_name}: {", ".join(recipe_ingredients)}')

    def search_recipe(self, name):
        if name in self.recipes:
            print(f'Recipe for {name}: {", ".join(self.recipes[name])}')
        else:
            print('The recipe has not been found, please try again.')

    def filter_recipe(self, ingredient):
        recipe_filter = [
            name for name, recipe_ingredients in self.recipes.items()
            if ingredient in recipe_ingredients
        ]

        if not recipe_filter:
            print(f'No recipes found containing {ingredient}, please try again.')
            return
        
        print(f'Recipes containing {ingredient}:')
        for name in recipe_filter:
            print(name)


def main():
    organizer = RecipeOrganizer()   

    print("Welcome to Ville's Recipe")

    while True:
        try:
            option = int(input(
                '1. Add recipe.\n'
                '2. List recipes.\n'
                '3. Search recipe.\n'
                '4. Filter recipes by ingredient.\n'
                '5. Exit.\n'
                'Choose an option: '
            ))

            if option == 1:
                recipe_name = input('Enter the recipe name: ')
                recipe_ingredients = input('Enter ingredients with commas: ').split(',')
                ingredients = [ingredient.strip() for ingredient in recipe_ingredients]

                organizer.add_recipe(recipe_name.strip(), ingredients)

            elif option == 2:
                organizer.list_recipes()

            elif option == 3:
                name = input('Enter recipe name to search for: ')
                organizer.search_recipe(name.strip())

            elif option == 4:
                ingredient = input('Enter ingredient to filter by: ')
                organizer.filter_recipe(ingredient.strip())

            elif option == 5:
                print('Goodbye! Thank you for using Ville Recipe.')
                break

            else:
                print('Invalid choice. Please try again.')

        except ValueError:
            print('Invalid input. Please enter a valid integer option.')


if __name__ == '__main__':
    main()