import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:queritel_practical/enums/pet.dart';
import 'package:queritel_practical/models/pet.dart';

class ApiService {
  final _catEndpoint = Uri.parse(
    'https://mocki.io/v1/77290441-d8e9-483f-80a2-a336a3364bbe',
  );

  final _dogEndpoint = Uri.parse(
    'https://mocki.io/v1/442a4801-5715-474a-b6fd-7548ab2f8d20',
  );

  Future<List<Pet>> getpets(PetEnum pet) async {
    try {
      final response = await http.get(
        pet == PetEnum.cat ? _catEndpoint : _dogEndpoint,
      );

      if (response.statusCode != 200) {}

      final body = jsonDecode(response.body);
      final pets = body[pet.displayString] as List<dynamic>;

      return pets.map((pet) => Pet.fromJson(pet)).toList();
    } on HttpException catch (e) {
      debugPrint(e.message);
      rethrow;
    } on SocketException catch (e) {
      debugPrint(e.message);
      rethrow;
    } on FormatException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }
}
