import 'dart:convert';

import 'package:detecto_app/utils/utils.dart';
import 'package:http/http.dart' as http;

Future UserRegister(String email,String pass)async{
     final response=await http.post('${Utils.baseUrl}/user/register' as Uri,
       headers:{"Accept":"Application/json"},
       body: {"email":email,"password":pass},
      );
     var decodedData=jsonDecode(response.body);
     return decodedData;
}

Future<void> fetchData() async {
  // Make a GET request
  final responseGet = await http.get(Uri.parse('http://your-node-backend.com/api/data'));
  print('GET response: ${responseGet.body}');

  // Make a POST request
  final responsePost = await http.post(
    Uri.parse('http://your-node-backend.com/api/data'),
    body: {'key': 'value'},
  );
  print('POST response: ${responsePost.body}');

  // Make a PUT request
  final responsePut = await http.put(
    Uri.parse('http://your-node-backend.com/api/data/1'),
    body: {'key': 'value'},
  );
  print('PUT response: ${responsePut.body}');

  // Make a DELETE request
  final responseDelete = await http.delete(Uri.parse('http://your-node-backend.com/api/data/1'));
  print('DELETE response: ${responseDelete.body}');
}


