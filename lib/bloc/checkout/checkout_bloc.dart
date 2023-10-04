import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/products_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Loaded([])) {
    on<_AddToCart>((event, emit) {
      final currenState = state as _Loaded;
      final productQuantity = ProductQuantity(
        product: event.product,
        quantity: event.quantity,
      );

      if (currenState.products
          .where((element) => element.product == event.product)
          .isNotEmpty) {
        for (var productQuantity in currenState.products) {
          if (productQuantity.product == event.product) {
            productQuantity.quantity =
                productQuantity.quantity + event.quantity;
          }
        }
        final newState = currenState.products;
        emit(const _Loading());
        emit(_Loaded(newState));
      } else {
        emit(_Loaded([
          ...currenState.products,
          productQuantity,
        ]));
      }

      // if (currenState.products.contains(productQuantity)) {
      //   final newState = currenState.products.map((e) {
      //     if (e == productQuantity) {
      //       return ProductQuantity(
      //         product: e.product,
      //         quantity: e.quantity + event.quantity,
      //       );
      //     } else {
      //       return e;
      //     }
      //   }).toList();
      //   emit(const _Loading());
      //   emit(_Loaded(newState));
      // } else {
      //   emit(_Loaded([
      //     ...currenState.products,
      //     productQuantity,
      //   ]));
      // }
    });
  }
}
