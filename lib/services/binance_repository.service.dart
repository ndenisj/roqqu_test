import 'dart:convert';

import 'package:candlestick_digiasset/candlestick_digiasset.dart';
import 'package:http/http.dart' as http;
import 'package:roqqu_test/constants.dart';
import 'package:roqqu_test/utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'logger.dart';

class BinanceRepository {
  Logger logger = Logger('BinanceRepository');

  Future<List<Candle>> fetchCandles(
      {required String symbol, required String interval, int? endTime}) async {
    logger.log('fetchCandles() called');
    final uri = Uri.parse(getBinanaceKlinesUri(
        symbol: symbol, interval: interval, endTime: endTime));
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  Future<List<String>> fetchSymbols() async {
    logger.log('fetchSymbols() called');
    final uri = Uri.parse(kBinanceTickerPriceURI);
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => e["symbol"] as String)
        .toList();
  }

  WebSocketChannel establishConnection(String symbol, String interval) {
    logger.log('establishConnection() called');
    final channel = WebSocketChannel.connect(
      Uri.parse(kBinanceKlineWS),
    );
    channel.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": [symbol + "@kline_" + interval],
          "id": 1
        },
      ),
    );
    return channel;
  }
}
