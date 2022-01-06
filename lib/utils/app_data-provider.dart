import 'package:ehjz_flutter/models/event_list_model.dart';
import 'package:ehjz_flutter/utils/app_icons.dart';

class AppDataProvider {
  static List<EventListModel> getEventList() {
    List<EventListModel> list = [];
    list.add(EventListModel(
        title: 'Clubs', icon: AppIcons.disco_ball_icon, isSelected: true));
    list.add(EventListModel(
        title: 'Lounge', icon: AppIcons.hookah_icon, isSelected: false));
    list.add(EventListModel(
        title: 'Bars', icon: AppIcons.bars_icon, isSelected: false));
    list.add(EventListModel(
        title: 'Beach Club', icon: AppIcons.beach_icon, isSelected: false));
    return list;
  }
}
