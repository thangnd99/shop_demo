part of 'detail_product_cubit.dart';

class DetailProductState extends Equatable {
  final LoadStatus loadStatus;
  final ProductEntity? productEntity;

  const DetailProductState({
    this.loadStatus = LoadStatus.initial,
    this.productEntity,
  });

  DetailProductState copyWith({
    LoadStatus? loadStatus,
    ProductEntity? productEntity,
  }) {
    return DetailProductState(
      loadStatus: loadStatus ?? this.loadStatus,
      productEntity: productEntity ?? this.productEntity,
    );
  }

  @override
  List<Object?> get props => [
        loadStatus,
        productEntity,
      ];
}
