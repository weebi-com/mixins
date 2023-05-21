import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_line_retail_abstract.dart';

import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/utils.dart' show DateRange, WeebiDates;
import 'package:models_weebi/weebi_models.dart';

class ArticleCalibreRetailStock implements StockNowLineRetailAbstract {
  @override
  final ArticleCalibre<ArticleRetail> articleCalibreRetail;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  final DateTime start;
  final DateTime end;
  ArticleCalibreRetailStock({
    required this.articleCalibreRetail,
    required this.ticketsInvoker,
    required this.closingStockShopsInvoker,
  })  : start = WeebiDates.defaultFirstDate,
        end = DateTime.now();

  bool get isSingleArticle => articleCalibreRetail.articles.length <= 1;

  @override
  double get stockNow => (ticketsInvoker()
          .stockLineInput(articleCalibreRetail, range: DateRange(start, end)) -
      ticketsInvoker()
          .stockLineOutput(articleCalibreRetail, range: DateRange(start, end)) +
      closingStockShopsInvoker().stockShopCaliberFinalQuantityAbsoluteForWeebi(
          articleCalibreRetail,
          end: end));
}
