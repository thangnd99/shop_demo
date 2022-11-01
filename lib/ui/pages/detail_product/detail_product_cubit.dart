import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_demo_app/models/entities/product/product_entity.dart';
import 'package:shop_demo_app/models/enums/load_status.dart';

part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  DetailProductCubit() : super(const DetailProductState());
}
