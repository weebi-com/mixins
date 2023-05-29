import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_line_retail_abstract.dart';

import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart' show DateRange;
import 'package:models_weebi/weebi_models.dart';

class ArticleCalibreRetailStock implements StockDiffLineRetailAbstract {
  @override
  final ArticleCalibre<ArticleRetail> calibreRetail;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  @override
  final DateTime start;
  @override
  final DateTime end;
  ArticleCalibreRetailStock({
    required this.calibreRetail,
    required this.ticketsInvoker,
    required this.closingStockShopsInvoker,
    required this.start,
    required this.end,
  });

  bool get isSingleArticle => calibreRetail.articles.length <= 1;

  @override
  double get stockDiffOverTimeRange =>
      closingStockShopsInvoker()
          .stockShopProductDiffTimeRangeForWeebi(calibreRetail, start, end) +
      (ticketsInvoker()
              .stockLineInput(calibreRetail, range: DateRange(start, end)) -
          ticketsInvoker()
              .stockLineOutput(calibreRetail, range: DateRange(start, end)));
}
