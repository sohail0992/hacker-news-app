import 'dart:convert';
import 'package:news/src/resources/news_api_provider.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of Ids', () async {
      final newsAPI = new NewsAPIProvider();
      newsAPI.client = MockClient((request) async {
        return Response(json.encode([1,2,3,4]), 200); 
      });
      final ids = await newsAPI.fetchTopIds();
      expect(ids, [1,2,3,4]);
  });

  test('FetchItem return Item Model', () async {
      final newsAPI = new NewsAPIProvider();
      newsAPI.client = MockClient((request) async {
        return Response(json.encode({
          'id': 123
        }), 200); 
      });
      final item = await newsAPI.fetchItem(999);
      expect(item.id, 123);
  });

}
