import 'package:flutter/material.dart';
import 'package:large_screens_sample/detail_screen.dart';
import 'package:large_screens_sample/window_size_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        final isLargeScreen = _isLargeScreen(context);

        return Row(children: <Widget>[
          Expanded(
            child: HomeView(count: 10, onItemSelected: _onItemSelected),
          ),
          isLargeScreen ? Expanded(child: DetailPage(selectedValue, key: ValueKey(selectedValue))) : Container(),
        ]);
      }),
    );
  }

  void _onItemSelected(int value) {
    final isLargeScreen = _isLargeScreen(context);

    selectedValue = value;
    if (isLargeScreen) {
      setState(() {});
    } else {
      _pushToDetailScreen(value);
    }
  }

  bool _isLargeScreen(BuildContext context) {
    final widthWindowSize = WindowSizeUtil.widthWindowSize(context);
    return widthWindowSize == WindowSize.medium || widthWindowSize == WindowSize.expanded;
  }

  void _pushToDetailScreen(int data) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data, key: ValueKey(data))));
}

typedef ItemSelectedCallback = void Function(int value);

class HomeView extends StatefulWidget {
  final int count;
  final ItemSelectedCallback onItemSelected;

  const HomeView({required this.count, required this.onItemSelected, super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              onTap: () => widget.onItemSelected(position),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      position.toString(),
                      style: const TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
