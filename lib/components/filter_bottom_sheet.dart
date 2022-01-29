import 'package:ehjz_flutter/utils/app_style.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues value = const RangeValues(100, 300);

  int? _selected = 0;

  bool _firstSelected = false;
  bool _secondSelected = false;
  bool _thirdSelected = false;
  bool _fourtySelected = false;
  bool _fiftySelected = false;
  bool _sixtySelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32.7, 22.0, 35.0, 91.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 32.0,
                  ),
                ),
                Text(
                  'Filters',
                  style: bottomSheetTitleTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Done',
                    style: bottomSheetCTATextStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 71.0,
            ),
            Text(
              'Filter by',
              style: bottomSheetSectionTitleStyle,
            ),
            const SizedBox(
              height: 18.5,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    filterChip(
                        text: 'Top rating',
                        selected: _firstSelected,
                        callback: () {
                          setState(
                            () {
                              _firstSelected = !_firstSelected;
                            },
                          );
                        }),
                    filterChip(
                        text: 'Comfort',
                        selected: _secondSelected,
                        callback: () {
                          setState(
                            () {
                              _secondSelected = !_secondSelected;
                            },
                          );
                        }),
                    filterChip(
                        text: 'Near You',
                        selected: _thirdSelected,
                        callback: () {
                          setState(
                            () {
                              _thirdSelected = !_thirdSelected;
                            },
                          );
                        }),
                  ],
                ),
                const SizedBox(
                  height: 11.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    filterChip(
                        text: 'Best price',
                        selected: _fourtySelected,
                        callback: () {
                          setState(
                            () {
                              _fourtySelected = !_fourtySelected;
                            },
                          );
                        }),
                    filterChip(
                        text: 'Popular',
                        selected: _fiftySelected,
                        callback: () {
                          setState(
                            () {
                              _fiftySelected = !_fiftySelected;
                            },
                          );
                        }),
                    filterChip(
                        text: 'Elegant',
                        selected: _sixtySelected,
                        callback: () {
                          setState(
                            () {
                              _sixtySelected = !_sixtySelected;
                            },
                          );
                        }),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              'Price range',
              style: bottomSheetSectionTitleStyle,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AEF  ${value.start.toInt()}',
                  style: bottomSheetFilterRangeTextStyle,
                ),
                Text(
                  'AED  ${value.end.toInt()}',
                  style: bottomSheetFilterRangeTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 14.0,
            ),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 1,
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: RangeSlider(
                activeColor: const Color(0xFFD99453),
                inactiveColor: const Color(0xFFE0E0E0),
                min: 0,
                max: 1000,
                values: value,
                onChanged: (values) {
                  setState(() {
                    value = values;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            const Divider(
              color: Color(0xFFEEEEEE),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              'Rating',
              style: bottomSheetSectionTitleStyle,
            ),
            const SizedBox(
              height: 13.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    choiceChip(
                      text: 'All',
                      selected: _selected == 0,
                      callback: () {
                        setState(() {
                          _selected = 0;
                        });
                      },
                    ),
                    choiceChip(
                      text: '5',
                      icon: const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Color(0xFFEEA86C),
                      ),
                      selected: _selected == 1,
                      callback: () {
                        setState(() {
                          _selected = 1;
                        });
                      },
                    ),
                    choiceChip(
                      text: '4',
                      icon: const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Color(0xFFEEA86C),
                      ),
                      selected: _selected == 2,
                      callback: () {
                        setState(() {
                          _selected = 2;
                        });
                      },
                    ),
                    choiceChip(
                      text: '3',
                      icon: const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Color(0xFFEEA86C),
                      ),
                      selected: _selected == 3,
                      callback: () {
                        setState(() {
                          _selected = 3;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17.36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 73.0,
                    ),
                    choiceChip(
                      text: '2',
                      icon: const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Color(0xFFEEA86C),
                      ),
                      selected: _selected == 4,
                      callback: () {
                        setState(() {
                          _selected = 4;
                        });
                      },
                    ),
                    choiceChip(
                      text: '1',
                      icon: const Icon(
                        Icons.star,
                        size: 16.0,
                        color: Color(0xFFEEA86C),
                      ),
                      selected: _selected == 5,
                      callback: () {
                        setState(() {
                          _selected = 5;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 82.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget filterChip({
    required String text,
    required bool selected,
    required VoidCallback callback,
  }) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      onSelected: (value) {
        callback();
      },
      labelStyle: selected
          ? bottomSheetFilterChipUnselectedTextStyle
          : bottomSheetFilterChipSelectedTextStyle,
      labelPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.030,
        vertical: 5.0,
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      selectedColor: const Color(0xFFD99453),
    );
  }

  Widget choiceChip({
    required String text,
    Icon? icon,
    required bool selected,
    required VoidCallback callback,
  }) {
    return ChoiceChip(
      avatar: icon != null
          ? InkWell(
              onTap: () {},
              child: icon,
            )
          : null,
      label: Text(text),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.038,
        vertical: 18.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      selected: selected,
      onSelected: (value) {
        callback();
      },
      labelStyle: bottomSheetChoiceChipUnselectedTextStyle,
      backgroundColor: const Color(0xFFF9F9FB),
      selectedColor: const Color(0xFFFFDDBD),
    );
  }
}
