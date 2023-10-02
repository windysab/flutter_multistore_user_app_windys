part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = _Started;
  const factory ProductsEvent.getAll() = _GetAll;
  // const factory ProductsEvent.getProducts() = _GetProducts;
  // const factory ProductsEvent.getProductsByCategory(String id) =
  //     _GetProductsByCategory;
  // const factory ProductsEvent.getProductsByBrand(String id) = _GetProductsByBrand;

   const factory ProductsEvent.getByCategory(int categoryId) = _GetByCategory;
}