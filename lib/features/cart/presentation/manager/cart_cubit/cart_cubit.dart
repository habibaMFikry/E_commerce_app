import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:store_app/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Map<dynamic, CartModel> items = {};

  int get itemCount {
    int count = 0;
    items.forEach((productId, value) => count += value.quantity);
    return count;
  }

  double get totalAmount {
    var total = 0.0;
    items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(dynamic productId, num price, String title, String image) {
    if (items.containsKey(productId)) {
      //change quantity
      items.update(
          productId,
          (existingCartItem) => CartModel(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                image: existingCartItem.image,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      items.putIfAbsent(
        productId,
        () => CartModel(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          image: image,
          quantity: 1,
        ),
      );
    }
    emit(CartSuccess());
  }

  void removeItem(dynamic prouductId) {
    items.remove(prouductId);
    emit(CartSuccess());
  }

  addOrRemoveQuantity(dynamic productId, bool operators, int quantity) {
    //remove only one
    emit(CartLoading());
    try {
      if (quantity == 1 && operators == false) {
        items.remove(productId);
        emit(CartSuccess());
      } else if (quantity >= 1 && items.containsKey(productId)) {
        items.update(
          productId,
          (existingCartItem) => CartModel(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              image: existingCartItem.image,
              quantity: operators
                  ? existingCartItem.quantity + 1
                  : existingCartItem.quantity - 1),
        );
        emit(CartSuccess());
      } else {
        items.remove(productId);
        emit(CartSuccess());
      }
    } catch (e) {
      emit(CartFailure());
    }
  }

  void clear() {
    items = {};
    emit(CartSuccess());
  }

  void removeSingleItem(dynamic productId) {
    if (!items.containsKey(productId)) {
      emit(CartSuccess());
      return;
    }
    if (items[productId]!.quantity > 1) {
      items.update(
        productId,
        (existingCartItem) => CartModel(
          id: existingCartItem.id,
          price: existingCartItem.price,
          image: existingCartItem.image,
          quantity: existingCartItem.quantity - 1,
          title: existingCartItem.title,
        ),
      );
      emit(CartSuccess());
    } else {
      items.remove(productId);
      emit(CartSuccess());
    }
  }
}
