class Ev {
  String? arrtime; // 충전소 주소
  String? bussnum; // 충전기 타입

  Ev({
    this.arrtime,
    this.bussnum,
  });

  factory Ev.fromJson(Map<String, dynamic>? json) {
    return Ev(
      arrtime: json?["arrtime"] as String,
      bussnum: json?["routeno"] as String,
    );
  }
}