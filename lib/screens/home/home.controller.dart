import 'dart:convert';

import 'package:candlestick_digiasset/candlestick_digiasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_test/models/tiker.model.dart';
import 'package:roqqu_test/services/binance_repository.service.dart';
import 'package:roqqu_test/services/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController {
  Logger logger = Logger('HomeControler');

  BinanceRepository repository = BinanceRepository();

  RxList<Candle> candles = <Candle>[].obs;
  WebSocketChannel? channel;
  bool themeIsDark = false;
  RxString currentInterval = "1m".obs;
  final intervals = [
    '1m',
    '3m',
    '5m',
    '15m',
    '30m',
    '1h',
    '2h',
    '4h',
    '6h',
    '8h',
    '12h',
    '1d',
    '3d',
    '1w',
    '1M',
  ];
  RxList<String> symbols = <String>[].obs;
  RxString currentSymbol = "".obs;
  RxString high = "".obs;
  RxString low = "".obs;
  RxString volume = "".obs;
  // RxString volume= "".obs;

  @override
  void onInit() {
    logger.log('Controller initialized');
    fetchSymbols().then((value) {
      symbols.value = value;
      if (symbols.isNotEmpty) fetchCandles(symbols[0], currentInterval.value);
    });
    super.onInit();
  }

  @override
  void dispose() {
    logger.log('Controller disposed');
    if (channel != null) channel!.sink.close();
    super.dispose();
  }

  Future<List<String>> fetchSymbols() async {
    try {
      // load candles info
      final data = await repository.fetchSymbols();
      return data;
    } catch (e) {
      // handle error
      return [];
    }
  }

  Future<void> fetchCandles(String symbol, String interval) async {
    // close current channel if exists
    if (channel != null) {
      channel!.sink.close();
      channel = null;
    }
    candles.value = [];
    currentInterval.value = interval;

    try {
      // load candles info
      final data =
          await repository.fetchCandles(symbol: symbol, interval: interval);
      // connect to binance stream
      channel = repository.establishConnection(
          symbol.toLowerCase(), currentInterval.value);
      // update candles

      candles.value = data;
      high.value = candles[0].high.toString();
      low.value = candles[0].low.toString();
      volume.value = candles[0].volume.toString();

      currentInterval.value = interval;
      currentSymbol.value = symbol;
      logger.log('Established');
      update();
    } catch (e) {
      // handle error
      logger.log('NOT-Established $e');
      return;
    }
  }

  void updateCandlesFromSnapshot(AsyncSnapshot<Object?> snapshot) {
    if (candles.isEmpty) return;
    if (snapshot.data != null) {
      final map = jsonDecode(snapshot.data as String) as Map<String, dynamic>;
      if (map.containsKey("k") == true) {
        final candleTicker = CandleTickerModel.fromJson(map);

        // cehck if incoming candle is an update on current last candle, or a new one
        if (candles[0].date == candleTicker.candle.date &&
            candles[0].open == candleTicker.candle.open) {
          // update last candle
          candles[0] = candleTicker.candle;
          //
          high.value = candles[0].high.toString();
          low.value = candles[0].low.toString();
          volume.value = candles[0].volume.toString();
        }
        // check if incoming new candle is next candle so the difrence
        // between times must be the same as last existing 2 candles
        else if (candleTicker.candle.date.difference(candles[0].date) ==
            candles[0].date.difference(candles[1].date)) {
          // add new candle to list
          candles.insert(0, candleTicker.candle);
        }
      }
    }
  }

  Future<void> loadMoreCandles() async {
    try {
      // load candles info
      final data = await repository.fetchCandles(
          symbol: currentSymbol.value,
          interval: currentInterval.value,
          endTime: candles.last.date.millisecondsSinceEpoch);
      candles.removeLast();

      candles.addAll(data);
    } catch (e) {
      // handle error
      return;
    }
  }
}
