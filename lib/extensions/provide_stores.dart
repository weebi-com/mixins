import 'package:flutter/material.dart';
import 'package:mixins_weebi/stock/mixins/line_stock_now_mixin.dart';
import 'package:provider/provider.dart';

class AbstractStore {}

extension ProvideStores on BuildContext {
  TicketsStore get ticketsStore =>
      Provider.of<TicketsStore>(this, listen: false);
  ClosingsStore get closingsStore =>
      Provider.of<ClosingsStore>(this, listen: false);
}
