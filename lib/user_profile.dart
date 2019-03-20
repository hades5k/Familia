import 'package:flutter/material.dart';

import './auth.dart';

class UserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserProfileState();
  }
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    authService.profile.listen(
        (Map<String, dynamic> state) => setState(() => _profile = state));

    authService.loading
        .listen((bool state) => setState(() => _loading = state));
  }

  Widget _buildUserProfileImage() {
    if (_profile == null || _profile['photoURL'] == null) {
      return Container();
    } else {
      return Image.network(_profile['photoURL']);
    }
  }

  Widget _buildUserProfileCard() {
    if (_profile == null ||
        _profile.toString().isEmpty ||
        _profile['photoURL'] == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Image.network(
            _profile['photoURL'],
            width: 50.0,
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _profile['displayName'],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _profile['email'],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Last connected: ${_profile['lastSeen']}',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildUserProfileCard(),
        Text(_loading.toString()),
      ],
    );
  }
}
