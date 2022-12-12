import 'dart:io' as io;

import 'package:dart_testes_001/model/person.dart';
import 'package:dart_testes_001/repository/person_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  late PersonRepository repository;
  late http.Client client = ClientMock();

  const jsonReturn =
      '[{"firstName":"Rod","lastName":"Cremin","age":68,"height":99,"weight":83,"id":"1"},{"firstName":"Una","lastName":"Skiles","age":55,"height":95,"weight":34,"id":"2"},{"firstName":"Jon","lastName":"Macejkovic","age":93,"height":32,"weight":80,"id":"3"},{"firstName":"Skye","lastName":"Mitchell","age":28,"height":26,"weight":2,"id":"4"},{"firstName":"Clemens","lastName":"Pfannerstill","age":77,"height":70,"weight":3,"id":"5"},{"firstName":"Wava","lastName":"Goldner","age":88,"height":44,"weight":0,"id":"6"},{"firstName":"Aron","lastName":"Rowe","age":14,"height":58,"weight":23,"id":"7"},{"firstName":"Zion","lastName":"Deckow","age":3,"height":49,"weight":85,"id":"8"},{"firstName":"Alexzander","lastName":"Bashirian","age":38,"height":6,"weight":31,"id":"9"},{"firstName":"Gracie","lastName":"Flatley","age":24,"height":37,"weight":71,"id":"10"},{"firstName":"Waldo","lastName":"Jakubowski","age":31,"height":40,"weight":19,"id":"11"},{"firstName":"Micaela","lastName":"Reynolds","age":49,"height":5,"weight":2,"id":"12"},{"firstName":"Yolanda","lastName":"Cronin","age":75,"height":94,"weight":56,"id":"13"},{"firstName":"Alanis","lastName":"Stark","age":5,"height":26,"weight":98,"id":"14"},{"firstName":"Jameson","lastName":"Botsford","age":5,"height":10,"weight":54,"id":"15"},{"firstName":"Virgil","lastName":"Kirlin","age":49,"height":48,"weight":43,"id":"16"},{"firstName":"Yvonne","lastName":"Ritchie","age":23,"height":90,"weight":78,"id":"17"},{"firstName":"Sigurd","lastName":"Mertz","age":74,"height":86,"weight":55,"id":"18"},{"firstName":"Kade","lastName":"Luettgen","age":74,"height":31,"weight":14,"id":"19"},{"firstName":"Wilhelmine","lastName":"Renner","age":40,"height":82,"weight":96,"id":"20"},{"firstName":"Isac","lastName":"King","age":92,"height":76,"weight":29,"id":"21"},{"firstName":"Eric","lastName":"Gerlach","age":95,"height":89,"weight":36,"id":"22"},{"firstName":"Elaina","lastName":"Blick","age":1,"height":52,"weight":66,"id":"23"},{"firstName":"Nora","lastName":"Cummings","age":59,"height":22,"weight":10,"id":"24"},{"firstName":"Serena","lastName":"Hettinger","age":99,"height":62,"weight":27,"id":"25"},{"firstName":"Samara","lastName":"Smitham","age":75,"height":30,"weight":61,"id":"26"},{"firstName":"Johathan","lastName":"Zemlak","age":32,"height":27,"weight":18,"id":"27"},{"firstName":"Terrell","lastName":"Marvin","age":69,"height":9,"weight":77,"id":"28"},{"firstName":"Mariam","lastName":"Bartell","age":14,"height":55,"weight":78,"id":"29"},{"firstName":"Cassandre","lastName":"Bahringer","age":71,"height":63,"weight":55,"id":"30"},{"firstName":"Shea","lastName":"Towne","age":71,"height":1,"weight":8,"id":"31"},{"firstName":"Dustin","lastName":"Crooks","age":9,"height":67,"weight":76,"id":"32"},{"firstName":"Cornelius","lastName":"Gorczany","age":89,"height":43,"weight":39,"id":"33"},{"firstName":"Mazie","lastName":"Monahan","age":1,"height":95,"weight":48,"id":"34"},{"firstName":"Dane","lastName":"Ortiz","age":92,"height":19,"weight":84,"id":"35"},{"firstName":"Lexi","lastName":"Wisozk","age":87,"height":71,"weight":80,"id":"36"},{"firstName":"Brennon","lastName":"Moore","age":48,"height":1,"weight":42,"id":"37"},{"firstName":"Alisa","lastName":"Collier","age":35,"height":86,"weight":77,"id":"38"},{"firstName":"Sonia","lastName":"Paucek","age":96,"height":31,"weight":52,"id":"39"},{"firstName":"Eldora","lastName":"Bayer","age":2,"height":72,"weight":24,"id":"40"},{"firstName":"Shayne","lastName":"Emard","age":82,"height":77,"weight":85,"id":"41"},{"firstName":"Eddie","lastName":"Parisian","age":70,"height":50,"weight":66,"id":"42"},{"firstName":"Nicole","lastName":"Daugherty","age":9,"height":33,"weight":97,"id":"43"},{"firstName":"Bernita","lastName":"Halvorson","age":39,"height":16,"weight":95,"id":"44"},{"firstName":"Everett","lastName":"Satterfield","age":25,"height":83,"weight":26,"id":"45"},{"firstName":"Kristina","lastName":"Ledner","age":61,"height":2,"weight":49,"id":"46"},{"firstName":"Bradley","lastName":"Hessel","age":28,"height":47,"weight":100,"id":"47"},{"firstName":"Delmer","lastName":"Farrell","age":25,"height":85,"weight":41,"id":"48"},{"firstName":"Keven","lastName":"Kunze","age":63,"height":6,"weight":94,"id":"49"},{"firstName":"Javonte","lastName":"Huel","age":55,"height":69,"weight":10,"id":"50"}]';

  setUpAll(() {
    client = ClientMock();
    repository = PersonRepository(client);
  });

  test('Deve obter uma lista de person', () async {
    when(() => client.get(Uri.parse(PersonRepository.URL_GET))).thenAnswer(
        (invocation) async => http.Response(jsonReturn, io.HttpStatus.ok));

    final list = await repository.getPerson();

    expect(list.isNotEmpty, isTrue);
    expect(list, allOf([isA<List<Person>>()]));
    expect(list.first.firstName, equals('Rod'));
  });

  test('Testando exception em caso de falha na request', () async {
    when(() => client.get(Uri.parse(PersonRepository.URL_GET))).thenAnswer(
        (invocation) async =>
            http.Response(jsonReturn, io.HttpStatus.unauthorized));

    expect(() async => await repository.getPerson(), throwsException);
  });
}
