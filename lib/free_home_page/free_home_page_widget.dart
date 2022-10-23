import 'package:aetherius_cloud/index.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FreeHomePageWidget extends StatefulWidget {
  const FreeHomePageWidget({Key? key}) : super(key: key);

  @override
  _FreeHomePageWidgetState createState() => _FreeHomePageWidgetState();
}

class _FreeHomePageWidgetState extends State<FreeHomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthUserStreamWidget(
              child: Text(
                'Welcome, ${currentUserDisplayName}',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22,
                    ),
              ),
            ),
          ],
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StartPageWidget()));
            },
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category Enlightment',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Text(
                                'See all',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<AlbumRecord>>(
                                stream: queryAlbumRecord(
                                  queryBuilder: (albumRecord) =>
                                      albumRecord.where('category',
                                          isEqualTo: 'Enlightenment'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AlbumRecord> listViewAlbumRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewAlbumRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAlbumRecord =
                                          listViewAlbumRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'albumPage',
                                              queryParams: {
                                                'album': serializeParam(
                                                  listViewAlbumRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'album': listViewAlbumRecord,
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    listViewAlbumRecord.img,
                                                    'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/04/02/211518_1343746.jpg',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                listViewAlbumRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category Prayer Energy',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Text(
                                'See all',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<AlbumRecord>>(
                                stream: queryAlbumRecord(
                                  queryBuilder: (albumRecord) =>
                                      albumRecord.where('category',
                                          isEqualTo: 'Prayer energy'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AlbumRecord> listViewAlbumRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewAlbumRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAlbumRecord =
                                          listViewAlbumRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'albumPage',
                                              queryParams: {
                                                'album': serializeParam(
                                                  listViewAlbumRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'album': listViewAlbumRecord,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    listViewAlbumRecord.img,
                                                    'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/04/02/211518_1343746.jpg',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                listViewAlbumRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category Spiritual Healing',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Text(
                                'See all',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<AlbumRecord>>(
                                stream: queryAlbumRecord(
                                  queryBuilder: (albumRecord) =>
                                      albumRecord.where('category',
                                          isEqualTo: 'Spiritual Healing'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AlbumRecord> listViewAlbumRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewAlbumRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAlbumRecord =
                                          listViewAlbumRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'albumPage',
                                              queryParams: {
                                                'album': serializeParam(
                                                  listViewAlbumRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'album': listViewAlbumRecord,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    listViewAlbumRecord.img,
                                                    'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/04/02/211518_1343746.jpg',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                listViewAlbumRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category UFO\'s',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Text(
                                'See all',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<AlbumRecord>>(
                                stream: queryAlbumRecord(
                                  queryBuilder: (albumRecord) => albumRecord.where(
                                      'category',
                                      isEqualTo:
                                          'UFOs, aliens and their spiritual message'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AlbumRecord> listViewAlbumRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewAlbumRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAlbumRecord =
                                          listViewAlbumRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'albumPage',
                                              queryParams: {
                                                'album': serializeParam(
                                                  listViewAlbumRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'album': listViewAlbumRecord,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .bottomToTop,
                                                ),
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    listViewAlbumRecord.img,
                                                    'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/04/02/211518_1343746.jpg',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                listViewAlbumRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category Karma and reincarnation',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                      ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Text(
                                'See all',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: StreamBuilder<List<AlbumRecord>>(
                                stream: queryAlbumRecord(
                                  queryBuilder: (albumRecord) =>
                                      albumRecord.where('category',
                                          isEqualTo: 'Karma and reincarnation'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AlbumRecord> listViewAlbumRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewAlbumRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAlbumRecord =
                                          listViewAlbumRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                              'albumPage',
                                              queryParams: {
                                                'album': serializeParam(
                                                  listViewAlbumRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'album': listViewAlbumRecord,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .bottomToTop,
                                                ),
                                              },
                                            );
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    listViewAlbumRecord.img,
                                                    'https://s3.amazonaws.com/media.thecrimson.com/photos/2020/04/02/211518_1343746.jpg',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                listViewAlbumRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
