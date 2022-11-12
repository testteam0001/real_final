import 'package:real_final_test/model/model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:real_final_test/provider/provider.dart';

class ListWidget extends StatelessWidget {
  ListWidget({Key? key}) : super(key: key);

  late EvProvider _evProvider; // EvProvider 호출

  Widget _makeEvOne(Ev ev) {
    return Row(
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 충전소 주소
                  Text(
                    ev.bussnum.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // 충전기 타입
                  Text(
                    ev.arrtime.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  // 리스트 뷰
  Widget _makeListView(List<Ev> evs) {
    var node = new List<String>.empty(growable: true);
    node.addAll(["190-3", "193", "190", "191", "195", "190-1", "192", "196", "190-2", "900", "193-2", "5200", "51-1", "57", "557"]);
    var temp = new List<Ev>.empty(growable: true);
    for(int i  = 1; i < evs.length; i++){
      for(int j = 1; j < node.length; j++){
        if(evs[i].bussnum == node[j]){
          temp.add(evs[i]);
        }
      }
    }

    return ListView.separated(
      itemCount: temp.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(height: 100, color: Colors.white, child: _makeEvOne(temp[index]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of를 통해 데이터를 접근한다. builder만을 업데이트 하기 위해 listen은 false로 한다.
    _evProvider = Provider.of<EvProvider>(context, listen: false);
    _evProvider.loadEvs(); // EvProvider에 loadEvs()의 접근

    return Scaffold(
        appBar: AppBar(
          title: Text("구미역 버스 도착 정보"),
        ),
        // Consumer를 통해 데이터를 접근
        body: Consumer<EvProvider>(builder: (context, provider, wideget) {
          // 데이터가 있으면 _makeListView에 데이터를 전달
          if (provider.evs != null && provider.evs.length > 0) {
            return _makeListView(provider.evs);
          }

          // 데이터가 없으면 CircularProgressIndicator 수행(로딩)
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
