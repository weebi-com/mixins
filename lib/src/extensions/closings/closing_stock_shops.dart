import 'package:mixins_weebi/src/extensions/closings/filter_by_range.dart';
import 'package:collection/collection.dart';

import 'package:models_weebi/base.dart';
import 'package:models_weebi/closings.dart';
import 'package:models_weebi/utils.dart';

extension StockItUpTillYaGetEnough on Iterable<ClosingStockShop> {
  double stockShopProductDiffTimeRangeForWeebi(
      LineArticleAbstract line, DateTime start, DateTime end) {
    var finalQtSum = 0.0;
    var initQtSum = 0.0;
    if (isNotEmpty) {
      // used set up a dateRange filter
      final _closingStockShops = <ClosingStockShop>[];
      if (start != null && end != null) {
        if (filterByRange(start, end).isNotEmpty) {
          final temp = filterByRange(start, end);
          _closingStockShops.addAll(temp);
          if (_closingStockShops.isNotEmpty) {
            finalQtSum += _closingStockShops.fold(
                  0.0,
                  (prev, shopCl) =>
                      prev +
                      shopCl.products
                          .where((e) => e.id == line.id)
                          .fold(0.0, (pv, e) => pv + e.finalQtCl),
                ) ??
                0.0;
            initQtSum += _closingStockShops.fold(
                  0.0,
                  (pv, shopCl) =>
                      pv +
                      shopCl.products.where((e) => e.id == line.id).fold(
                          0.0, (pvs, element) => pvs + element.initialQtCl),
                ) ??
                0.0;
          }
        }
      }
      //print('$uuid $productId initQtSum $initQtSum');
      //print('$uuid $productId finalQtSum $finalQtSum');
    }
    return finalQtSum - initQtSum;
  }

  double stockShopLineFinalQuantityAbsoluteForWeebi(LineArticleAbstract line,
      {DateTime end}) {
    var daDiff = 0.0;
    if (isNotEmpty) {
      var filterByDates = List<ClosingStockShop>.of([]);
      if (end != null) {
        filterByDates = where((c) =>
            c.closingRange.endDate.isBefore(end) ||
            c.closingRange.endDate.isAtSameMomentAs(end)).toList();
      } else {
        filterByDates = this;
      }
      filterByDates.sort((a, b) =>
          a.closingRange.startDate.compareTo(b.closingRange.startDate));
      daDiff += filterByDates.last.products
              .firstWhereOrNull((p) => p.id == line.id)
              ?.finalQtCl ??
          0.0;
    }
    return daDiff;
  }

  double
      stockShopArticleFinalQuantityAbsoluteForWeebi<A extends ArticleAbstract>(
    A article, {
    DateTime end,
  }) {
    var finalQtAllShopsSummed = 0.0;
    if (isNotEmpty) {
      var filteredByDate = List<ClosingStockShop>.of([]);
      if (end != null) {
        filteredByDate = where((c) =>
            c.closingRange.endDate.isBefore(end) ||
            c.closingRange.endDate.isAtSameMomentAs(end)).toList();
      } else {
        filteredByDate = this;
      }
      if (filteredByDate.isNotEmpty) {
        filteredByDate.toList().sort((a, b) =>
            a.closingRange.startDate.compareTo(b.closingRange.startDate));
        final daObject = filteredByDate.last;
        finalQtAllShopsSummed += daObject.products
                .firstWhereOrNull((e) => e.id == article.lineId)
                ?.articles
                ?.firstWhereOrNull(
                    (a) => a.lineId == article.lineId && a.id == article.id)
                ?.finalQtCl ??
            0.0;
      }
    }
    return finalQtAllShopsSummed;
  }

  double stockShopArticleQtInTimeRangeForWeebi<A extends ArticleAbstract>(
      A article, DateRange range) {
    var _qtIn = 0.0;
    final _closingStockShops = <ClosingStockShop>[];
    if (isNotEmpty) {
      if (range.startDate != null && range.endDate != null) {
        if (filterByRange(range.startDate, range.endDate).isNotEmpty) {
          _closingStockShops
              .addAll(filterByRange(range.startDate, range.endDate));
        }
      }
      _qtIn += _closingStockShops.fold(
              0.0,
              (prev, shopCl) =>
                  prev +
                  shopCl.products.where((p) => p.id == article.lineId).fold(
                        0.0,
                        (previous, product) =>
                            previous +
                            product.articles
                                .where((a) =>
                                    a.productId == article.lineId &&
                                    a.id == article.id)
                                .fold(
                                    0.0,
                                    (previousStuff, article) =>
                                        previousStuff + article.quantityIn),
                      )) ??
          0.0;
    } else {
      // print('shopUuids is Empty OR closingStockShops is Empty');
    }
    return (_qtIn);
  }

  double stockShopArticleQtOutTimeRangeForWeebi<A extends ArticleAbstract>(
      A article, DateRange range) {
    var _qtOut = 0.0;
    final _closingStockShops = <ClosingStockShop>[];
    if (isNotEmpty) {
      if (range.startDate != null && range.endDate != null) {
        if (filterByRange(range.startDate, range.endDate).isNotEmpty) {
          _closingStockShops
              .addAll(filterByRange(range.startDate, range.endDate));
        }
      }
      _qtOut += _closingStockShops.fold(
              0.0,
              (prev, shopCl) =>
                  prev +
                  shopCl.products.where((p) => p.id == article.lineId).fold(
                        0.0,
                        (previous, product) =>
                            previous +
                            product.articles
                                .where((a) =>
                                    a.productId == article.lineId &&
                                    a.id == article.id)
                                .fold(
                                    0.0,
                                    (previousStuff, article) =>
                                        previousStuff + article.quantityOut),
                      )) ??
          0.0;
    } else {
      // print('shopUuids is Empty OR closingStockShops is Empty');
    }
    return (_qtOut);
  }
}
