import 'package:coffee_app/service/constants/image_const.dart';

import '../models/cart.dart';

class Datas {
  static List<CoffeeModel> select(CoffeeType coffeeType) {
    switch (coffeeType) {
      case CoffeeType.tradicionais:
        return [
          CoffeeModel(
              image: AppImages.expressoTrad,
              title: 'Expresso Tradicional',
              description:
                  'O tradicional café feito com água quente e grãos moídos',
              price: 9.90,
              category: coffeeType.name,
              id: 1),
          CoffeeModel(
            image: AppImages.expressoAmeric,
            title: 'Expresso Americano',
            description: 'Expresso diluído, menos intenso que o tradicional',
            price: 9.90,
            category: coffeeType.name,
            id: 2,
          ),
          CoffeeModel(
              image: AppImages.expressoCremoso,
              title: 'Expresso Cremoso',
              description: 'Café expresso tradicional com espuma cremosa',
              price: 9.90,
              category: coffeeType.name,
              id: 3),
          CoffeeModel(
              image: AppImages.latte,
              title: 'Latte',
              description:
                  'Café expresso com o dobro de leite e espuma cremosa',
              price: 9.90,
              category: coffeeType.name,
              id: 4),
          CoffeeModel(
              image: AppImages.expressoGelado,
              title: 'Expresso Gelado',
              description: 'Bebida preparada com café expresso e cubos de gelo',
              price: 9.90,
              category: coffeeType.name,
              id: 5),
        ];
      case CoffeeType.doces:
        return [
          CoffeeModel(
              image: AppImages.capuccino,
              id: 6,
              title: 'Capuccino',
              description:
                  'Bebida com canela feita de doses de café, leite e espuma',
              price: 9.90,
              category: coffeeType.name),
          CoffeeModel(
              image: AppImages.mocaccino,
              id: 7,
              title: 'Mocaccino',
              description:
                  'Café expresso com calda de chocolate, pouco leite e espuma',
              price: 9.90,
              category: coffeeType.name),
          CoffeeModel(
              image: AppImages.chocolate,
              title: 'Chocolate Quente',
              description:
                  'Bebida feita com chocolate dissolvido no leite quente e café',
              price: 9.90,
              category: coffeeType.name,
              id: 8),
        ];
      case CoffeeType.especiais:
        return [
          CoffeeModel(
              image: AppImages.cubano,
              title: 'Cubano',
              description:
                  'Drink gelado de café expresso com rum, creme de leite e hortelã',
              price: 9.90,
              category: coffeeType.name,
              id: 9),
          CoffeeModel(
              image: AppImages.havaiano,
              title: 'Havaiano',
              description:
                  'Bebida adocicada preparada com café e leite de coco',
              price: 9.90,
              category: coffeeType.name,
              id: 10),
          CoffeeModel(
              image: AppImages.arabe,
              title: 'Arabe',
              description:
                  'Bebida preparada com grãos de café árabe e especiarias',
              price: 9.90,
              category: coffeeType.name,
              id: 11),
          CoffeeModel(
              image: AppImages.irlandes,
              title: 'Irlandes',
              description:
                  'Bebida a base de café, uísque irlandês, açúcar e chantilly',
              price: 9.90,
              category: coffeeType.name,
              id: 12),
        ];
    }
  }
}

enum CoffeeType {
  tradicionais,
  doces,
  especiais,
}
