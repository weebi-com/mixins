import 'package:mixins_weebi/mobx_store_closing.dart';
import 'package:sembast/sembast.dart';
import 'package:services_weebi/rpc_closings.dart';

ClosingsStore getTestClosingsStore(Database db) {
  final createClosingRangeRpc = CreateClosingRangeRpc(db);
  final deleteClosingRangeRpc = DeleteClosingRangeRpc(db);
  final addAllClosingRangesRpc = AddAllClosingRangesRpc(db);
  final getClosingRangesRpc = GetClosingRangesRpc(db);
  final getClosingLedgersRpc = GetClosingLedgersRpc(db);
  final addAllClosingLedgersRpc = AddAllClosingLedgersRpc(db);
  final getClosingsHerdersRpc = GetClosingsHerdersRpc(db);
  final addAllClosingsHerdersRpc = AddAllClosingsHerdersRpc(db);
  final getClosingLedgerShopsRpc = GetClosingLedgerShopsRpc(db);
  final addAllClosingLedgerShopsRpc = AddAllClosingLedgerShopsRpc(db);

  final getClosingsStocksFullRpc = GetClosingsStocksRpc(db);
  final addAllClosingsStocksFullRpc = AddAllClosingsStocksFullRpc(db);
  final getClosingsStockShopsRpc = GetClosingsStockShopsRpc(db);
  final addAllClosingsStockShopsRpc = AddAllClosingsStockShopsRpc(db);
  final getClosingsStockProductsRpc = GetClosingsStockProductsRpc(db);
  final addAllClosingsStockProductsRpc = AddAllClosingsStockProductsRpc(db);
  final getClosingsHerderStocksRpc = GetClosingsHerderStocksRpc(db);
  final addAllClosingsHerderStocksRpc = AddAllClosingsHerderStocksRpc(db);
  final deleteAllClosingObjects = DeleteAllClosingObjects(db);

  final closingsService = ClosingsService(
    createClosingRangeRpc,
    deleteClosingRangeRpc,
    addAllClosingRangesRpc,
    getClosingRangesRpc,
    getClosingLedgersRpc,
    addAllClosingLedgersRpc,
    getClosingLedgerShopsRpc,
    addAllClosingLedgerShopsRpc,
    getClosingsHerdersRpc,
    addAllClosingsHerdersRpc,
    getClosingsStocksFullRpc,
    addAllClosingsStocksFullRpc,
    getClosingsStockShopsRpc,
    addAllClosingsStockShopsRpc,
    getClosingsStockProductsRpc,
    addAllClosingsStockProductsRpc,
    getClosingsHerderStocksRpc,
    addAllClosingsHerderStocksRpc,
    deleteAllClosingObjects,
  );
  return ClosingsStore(closingsService);
}
