import 'services/networking.dart';
import 'price_screen.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];



const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apiKey = '8E0D9BCF-A1A3-4E37-8A07-04FE025DEB88';


class CoinData {

  Future getRate(String currency)async{
    var url = 'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apikey=$apiKey';
    var url1 = 'https://rest.coinapi.io/v1/exchangerate/ETH/$currency?apikey=$apiKey';
    var url2 = 'https://rest.coinapi.io/v1/exchangerate/LTC/$currency?apikey=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);
    NetworkHelper networkHelper1 = NetworkHelper(url1);
    NetworkHelper networkHelper2 = NetworkHelper(url2);

    var data = await networkHelper.getData();
    var data1 = await networkHelper1.getData();
    var data2 = await networkHelper2.getData();
    //double rate = data['rate'];

    return [data['rate'],data1['rate'],data2['rate']];

  }

}
void main () async{
//double rate = data['rate'];

}
