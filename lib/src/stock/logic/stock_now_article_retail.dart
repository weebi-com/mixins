import 'package:mixins_weebi/src/extensions/closings/closing_stock_shops.dart';
import 'package:mixins_weebi/src/invokers.dart';
import 'package:mixins_weebi/src/stock/abstracts/stock_article_abstract.dart';
import 'package:models_weebi/utils.dart' show DateRange, WeebiDates;
import 'package:models_weebi/extensions.dart';
import 'package:models_weebi/weebi_models.dart';

class ArticleRetailStockNow<AR extends ArticleRetail>
    implements StockNowArticleRetailAbstract<AR> {
  @override
  final AR article;
  @override
  final TicketsInvoker ticketsInvoker;
  @override
  final ClosingStockShopsInvoker closingStockShopsInvoker;
  final DateTime start;
  final DateTime end;
  ArticleRetailStockNow({
    required this.article,
    required this.ticketsInvoker,
    required this.closingStockShopsInvoker,
  })  : start = WeebiDates.defaultFirstDate,
        end = DateTime.now();

  @override
  double get stockNow =>
      closingStockShopsInvoker()
          .stockShopArticleFinalQuantityAbsoluteForWeebi(article, end: end) +
      (ticketsInvoker()
              .stockArticleInput(article, range: DateRange(start, end)) -
          ticketsInvoker()
              .stockArticleOutput(article, range: DateRange(start, end)));
}
