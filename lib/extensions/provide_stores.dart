import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ProvideStores on BuildContext {
  TicketsStore get ticketsStore =>
      Provider.of<TicketsStore>(this, listen: false);
  ClosingsStore get closingsStore =>
      Provider.of<ClosingsStore>(this, listen: false);
}
