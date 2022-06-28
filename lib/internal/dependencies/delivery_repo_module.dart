import 'package:innocart_front/data/api/service/delivery_service.dart';

import '../../data/repository/delivery_data_repository.dart';
import '../../domain/repository/delivery_repository.dart';

class DeliveryRepoModule {
  static final DeliveryRepository _deliveryRepository =
      DeliveryDataRepository(DeliveryService());

  static DeliveryRepository deliveryRepository() {
    return _deliveryRepository;
  }
}
