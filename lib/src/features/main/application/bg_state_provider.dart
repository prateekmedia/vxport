import 'package:flutter_riverpod/flutter_riverpod.dart';

final bgStateProvider = StateProvider<String>((ref) => "${bg[0]}&w=1260&h=750");

const bg = [
  "https://images.pexels.com/photos/7640904/pexels-photo-7640904.jpeg?auto=compress&cs=tinysrgb&dpr=1",
  "https://images.pexels.com/photos/3374210/pexels-photo-3374210.jpeg?auto=compress&cs=tinysrgb&dpr=1",
  "https://images.pexels.com/photos/14134071/pexels-photo-14134071.jpeg?auto=compress&cs=tinysrgb&dpr=1",
  "https://images.pexels.com/photos/2078266/pexels-photo-2078266.jpeg?auto=compress&cs=tinysrgb&dpr=1",
  "https://images.pexels.com/photos/1242348/pexels-photo-1242348.jpeg?auto=compress&cs=tinysrgb&dpr=1",
  "https://images.pexels.com/photos/4871011/pexels-photo-4871011.jpeg?auto=compress&cs=tinysrgb&dpr=1",
];
