import 'package:auto_updater/auto_updater.dart';
import 'package:flutter/material.dart';
import 'package:preference_list/preference_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _feedURL = 'http://localhost:5002/appcast.xml';

  @override
  void initState() {
    super.initState();
  }

  void _handleClickSetFeedURL() async {
    await autoUpdater.setFeedURL(_feedURL);
  }

  void _handleClickCheckForUpdates() async {
    await autoUpdater.checkForUpdates();
  }

  void _handleClickCheckForUpdatesWithoutUI() async {
    await autoUpdater.checkForUpdatesWithoutUI();
  }

  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: <Widget>[
        PreferenceListSection(
          title: const Text('METHODS'),
          children: [
            PreferenceListItem(
              title: const Text('setFeedURL'),
              detailText: Text(_feedURL),
              onTap: () {
                _handleClickSetFeedURL();
              },
            ),
            PreferenceListItem(
              title: const Text('checkForUpdates'),
              onTap: () {
                _handleClickCheckForUpdates();
              },
            ),
            PreferenceListItem(
              title: const Text('checkForUpdatesWithoutUI'),
              onTap: () {
                _handleClickCheckForUpdatesWithoutUI();
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: _buildBody(context),
    );
  }
}
