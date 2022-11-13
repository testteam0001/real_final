class Ev {
  int? arrtime; // 충전소 주소
  String? bussnum; // 충전기 타입

  Ev({
    this.arrtime,
    this.bussnum,
  });

  factory Ev.fromJson(Map<String, dynamic>? json) {
    var temp;

    if(json?["arrtime"] is String){
      temp = int.tryParse(json?["arrtime"] ?? "");
    }
    return Ev(
      arrtime: temp,
      bussnum: json?["routeno"] as String,
    );
  }
}