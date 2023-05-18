import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_line_retail_abstract.dart';

import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart' show DateRange;
import 'package:models_weebi/weebi_models.dart';

class ArticleLineRetailStock implements StockDiffLineRetailAbstract {
  @override
  final ArticleLine<ArticleRetail> line;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  @override
  final DateTime start;
  @override
  final DateTime end;
  ArticleLineRetailStock({
    required this.line,
    required this.ticketsInvoker,
    required this.closingStockShopsInvoker,
    required this.start,
    required this.end,
  });

  bool get isSingleArticle => line.articles.length <= 1;

  @override
  double get stockDiffOverTimeRange =>
      closingStockShopsInvoker()
          .stockShopProductDiffTimeRangeForWeebi(line, start, end) +
      (ticketsInvoker().stockLineInput(line, range: DateRange(start, end)) -
          ticketsInvoker().stockLineOutput(line, range: DateRange(start, end)));
}
