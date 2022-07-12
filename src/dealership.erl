-module(dealership).

%% API
-export([listPrices/1]).

listPrices(Currency) ->
  CarList = getCarList(),
  printPrice(CarList,Currency).



printPrice([], Currency) ->
  true;
printPrice([Car | Rest], Currency) ->
  CarMap = getCarMap(),
  Price = maps:get(Car, CarMap),
  ConvertedPrice = convertPrice(Price, Currency),
  io:fwrite("the price for " ++ Car ++ " is " ++ integer_to_list(ConvertedPrice) ++ "\n"),
  printPrice(Rest, Currency).


convertPrice(Price, Currency) ->
  case Currency of
    eur -> round(Price * 1.05);
    gbp -> round(Price * 1.22);
    usd -> Price
  end.

getCarList() ->
  ["Honda", "Subaru", "Toyota"].

getCarMap() ->
  #{"Honda" => 45000, "Subaru" => 50000, "Toyota" => 95000}.

