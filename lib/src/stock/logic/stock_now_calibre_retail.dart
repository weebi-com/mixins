import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_line_retail_abstract.dart';
// import 'package:models_weebi/base.dart';

import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart' show DateRange, WeebiDates;
import 'package:models_weebi/weebi_models.dart';

class CalibreRetailStockNow<AR extends ArticleRetail>
    implements StockNowLineRetailAbstract<AR> {
  @override
  final ArticleCalibre<AR> calibreRetail;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  final DateTime start;
  final DateTime end;
  CalibreRetailStockNow({
    required this.calibreRetail,
    required this.ticketsInvoker,
    required this.closingStockShopsInvoker,
  })  : start = WeebiDates.defaultFirstDate,
        end = DateTime.now();

  bool get isSingleArticle => calibreRetail.articles.length <= 1;

  @override
  double get stockNow => (ticketsInvoker()
          .stockLineInput(calibreRetail, range: DateRange(start, end)) -
      ticketsInvoker()
          .stockLineOutput(calibreRetail, range: DateRange(start, end)) +
      closingStockShopsInvoker().stockShopCaliberFinalQuantityAbsoluteForWeebi(
          calibreRetail,
          end: end));
}
