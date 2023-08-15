import 'package:inventory_app2/model/items.dart';

/// data : [{"itemId":1,"name":"Bulb","price":100.0,"image":"https://th.bing.com/th/id/OIP.EDNrZPbPpxzKpADKfe6rugHaIs?pid=ImgDet&w=199&h=233&c=7&dpr=1.3"},{"itemId":2,"name":"Music System","price":1000.0,"image":"https://th.bing.com/th?id=OIP.IQwt3hPc7lRI4zPtlPvF9wHaFB&w=303&h=206&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":3,"name":"Ps5","price":50000.0,"image":"https://th.bing.com/th?id=OIP.9o4Vawt-bPiChyRKPRRfWgHaFj&w=288&h=216&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":4,"name":"psp","price":5000.0,"image":"https://th.bing.com/th?id=OIP.haAnHMlXoytddnEOTS1qTAHaDc&w=350&h=162&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":5,"name":"XBox","price":50000.0,"image":"https://th.bing.com/th?id=OIP.LrAHuN07SQowKtJfhusRRQHaJP&w=223&h=279&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":6,"name":"Pc","price":30000.0,"image":"https://th.bing.com/th?id=OIP.i6b4cHc0xKnP77_ZE3qpTgHaFY&w=293&h=213&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":7,"name":"Laptops","price":25000.0,"image":"https://th.bing.com/th/id/OIP.sOdWXA8w_vNRtjpSjt6IdQHaFn?w=230&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"},{"itemId":8,"name":"Watch","price":3000.0,"image":"https://www.bing.com/th?id=OIP.lB9gHUxuwILFLx12jADU-AHaKY&w=150&h=210&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":9,"name":"Men Footwear","price":1000.0,"image":"https://th.bing.com/th/id/OIP.YTSDZguMO2uBdRYJy9WZDQHaEy?w=263&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"},{"itemId":10,"name":"Women Footwear","price":1000.0,"image":"https://th.bing.com/th/id/OIP.Y2c9u2oLEC6_u0FvmukUpwAAAA?w=210&h=186&c=7&r=0&o=5&dpr=1.3&pid=1.7"},{"itemId":11,"name":"Ps5 games","price":2000.0,"image":"https://th.bing.com/th?id=OIP.Tojqh2pJ1peBLuP6o1azGwHaGL&w=273&h=228&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"},{"itemId":12,"name":"XBox games","price":4000.0,"image":"https://th.bing.com/th/id/OIP.56rIfAZ3_Mb1b3QMEBZ9fwHaEK?w=313&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"}]

class ItemResponse {
  ItemResponse({
      List<Items>? data,}){
    _data = data;
}

  ItemResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        var item = Items(itemId: v['itemId'],name: v['name'],price: v['price'],image: v['image'], description: v['description']);
        _data?.add(item);
      });
    }
  }
  List<Items>? _data;

  List<Items>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// itemId : 1
/// name : "Bulb"
/// price : 100.0
/// image : "https://th.bing.com/th/id/OIP.EDNrZPbPpxzKpADKfe6rugHaIs?pid=ImgDet&w=199&h=233&c=7&dpr=1.3"

