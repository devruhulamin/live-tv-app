import 'dart:convert';
import 'dart:developer';
import 'package:mojo_live_tv/core/enums/tv_channels_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mojo_live_tv/domain/models/m3u8_models.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  SharedPreferencesService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<SharedPreferences> _ensurePrefs() async {
    if (_prefs == null) {
      await init();
    }
    return _prefs!;
  }

  Future<bool> isNeedUpdated(TvChannelsEnums channel) async {
    try {
      final prefs = await _ensurePrefs();
      final key = "${channel.name}updated";
      final lastSavedTime = DateTime.tryParse(prefs.getString(key) ?? '');
      print(lastSavedTime);
      if (lastSavedTime == null) {
        return true;
      }
      final now = DateTime.now();
      final difference = now.difference(lastSavedTime);
      print("time difference in minutes ${difference.inMinutes}");
      if (difference.inHours > 20) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception("ERROR: need Update $e");
    }
  }

  Future<void> channelSavedTimes(TvChannelsEnums channel) async {
    try {
      final prefs = await _ensurePrefs();
      final key = "${channel.name}updated";
      final time = DateTime.now().toIso8601String();
      prefs.setString(key, time);
    } catch (e) {
      log("ERROR: save time channels $e");

      rethrow;
    }
  }

  Future<void> saveChannelsToJson({required List<Channel>? channels, required TvChannelsEnums channelenum}) async {
    try {
      final prefs = await _ensurePrefs();
      final jsonChannels = channels?.map((channel) => channel.toJson()).toList();
      final jsonString = jsonEncode(jsonChannels);
      await prefs.setString(channelenum.name, jsonString);
      await channelSavedTimes(channelenum);
    } catch (e) {
      log("ERROR: save channel json error $e");
      rethrow;
    }
  }

  Future<List<Channel>?> getChannelsList({required TvChannelsEnums fileName}) async {
    try {
      final prefs = await _ensurePrefs();
      final jsonString = prefs.getString(fileName.name); // Fetch string directly
      if (jsonString == null) {
        return null;
      }
      final List<dynamic> jsonChannels = jsonDecode(jsonString); // Decode JSON to List
      print("json channels : $jsonChannels");
      final channels = jsonChannels.map((json) => Channel.fromJson(json)).toList();
      return channels;
    } catch (e) {
      log("Error : get channels List $e");
      return null;
    }
  }

  Future<void> removeValue(String key) async {
    final prefs = await _ensurePrefs();
    await prefs.remove(key);
  }

  // Clear all values
  Future<void> clearAll() async {
    final prefs = await _ensurePrefs();
    await prefs.clear();
  }
}
