import 'package:mixins_weebi/mobx_stores/closings.dart';
import 'package:services_weebi/rpc_closings.dart';

class ClosingsStoreInstantiater {
  static ClosingsStore get noPersistence {
    const closingsServiceNoSembast = ClosingsServiceFake();
    return ClosingsStore(closingsServiceNoSembast);
  }
}
