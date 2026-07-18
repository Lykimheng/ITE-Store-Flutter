import 'package:flutter_test/flutter_test.dart';

import 'package:finalexam/api/cart_manager.dart';
import 'package:finalexam/api/model/product.dart';

const laptop = Product(
  id: 1,
  name: 'Laptop',
  description: 'A laptop',
  thumbnail: 'laptop.png',
  price: 999.0,
);

const mouse = Product(
  id: 2,
  name: 'Mouse',
  description: 'A mouse',
  thumbnail: 'mouse.png',
  price: 25.0,
);

void main() {
  final cart = CartManager();

  setUp(cart.clear);

  test('starts empty', () {
    expect(cart.items, isEmpty);
    expect(cart.totalCount, 0);
    expect(cart.totalPrice, 0.0);
  });

  test('adding a product creates an item with quantity 1', () {
    cart.addProduct(laptop);

    expect(cart.items.length, 1);
    expect(cart.items.first.quantity, 1);
    expect(cart.totalCount, 1);
    expect(cart.totalPrice, 999.0);
  });

  test('adding the same product twice increases its quantity', () {
    cart.addProduct(laptop);
    cart.addProduct(laptop);

    expect(cart.items.length, 1);
    expect(cart.items.first.quantity, 2);
    expect(cart.totalCount, 2);
  });

  test('totals sum across different products', () {
    cart.addProduct(laptop);
    cart.addProduct(mouse);
    cart.addProduct(mouse);

    expect(cart.items.length, 2);
    expect(cart.totalCount, 3);
    expect(cart.totalPrice, 999.0 + 25.0 * 2);
  });

  test('increaseQuantity and decreaseQuantity adjust an item', () {
    cart.addProduct(laptop);
    cart.increaseQuantity(laptop.id);
    expect(cart.items.first.quantity, 2);

    cart.decreaseQuantity(laptop.id);
    expect(cart.items.first.quantity, 1);
  });

  test('decreasing quantity below 1 removes the item', () {
    cart.addProduct(laptop);
    cart.decreaseQuantity(laptop.id);

    expect(cart.items, isEmpty);
  });

  test('removeItem removes the whole line regardless of quantity', () {
    cart.addProduct(laptop);
    cart.addProduct(laptop);
    cart.removeItem(laptop.id);

    expect(cart.items, isEmpty);
  });

  test('clear empties the cart', () {
    cart.addProduct(laptop);
    cart.addProduct(mouse);
    cart.clear();

    expect(cart.items, isEmpty);
    expect(cart.totalPrice, 0.0);
  });
}
