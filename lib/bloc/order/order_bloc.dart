import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/order_remote_datasource.dart';
import '../../data/models/order_response_model.dart';
import '../../data/models/request/order_request_model.dart';



part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const _Initial()) {
    on<_Order>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().order(event.model);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}