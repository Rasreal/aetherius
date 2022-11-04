import 'package:aetherius_cloud/track_player_page222/track_player_page222_widget.dart';

import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Downloads',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowAudioPlayer(
                audio: Audio.network(
                  "/storage/emulated/0/Android/data/com.weloveflutterflow.aetherius/files/The Devic Kingdom.m4a",
                  metas: Metas(
                    id: 'the-weeknd-feat.-daft-punk-starboy_83016272.mp3-azvfq6q3',
                    title: 'Music',
                  ),
                ),
                titleTextStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                playbackDurationTextStyle:
                    FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF9D9D9D),
                          fontSize: 12,
                        ),
                fillColor: Color(0xFFEEEEEE),
                playbackButtonColor: FlutterFlowTheme.of(context).primaryColor,
                activeTrackColor: Color(0xFF57636C),
                elevation: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
