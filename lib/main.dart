
// ((((((((((((((((     reference : https://codelabs.developers.google.com/codelabs/flutter-adaptive-app#0     ))))))))))))))))))))))


// .................  ..........    Page 4 ................         ...................
//  replace content of main.dart file as provided by "https://codelabs.developers.google.com/codelabs/flutter-adaptive-app#3"


/// ... ... ... ... ... ... [ { "youTubeApiKey" must be Updated } ] ... ... ... ... ... ... ... ... ... ...

// ...........................................................................

// {{{{{{{{{{{{{{{ ... ... ...  Adapting to Mobile Screen ... ... ... }}}}}}}}}}}}}}}}}}}}}}

// ...........................................................................


// import 'dart:io';
//
// import 'package:flex_color_scheme/flex_color_scheme.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
//
// import 'src/app_state.dart';
// import 'src/playlist_details.dart';
// import 'src/playlists.dart';
//
// // Typically, when integrating YouTube API into a Flutter application, you need to specify the 'YouTube account ID' to fetch or manipulate data related to that account.
// // The account ID represents a unique identifier for a YouTube channel or user.
// // In this case, 'flutterDevAccountId' is set to the YouTube account ID 'UCwXdFgeE9KYzlDdR7TG9cMw'
// //  It refers to the YouTube channel associated with the Flutter development team on YouTube.
// //  The account ID identifies the channel where the Flutter development team uploads their official Flutter-related videos, tutorials, announcements, and other content.
// // By using this account ID in the Flutter YouTube API integration, you can access and retrieve data specifically related to the Flutter development team's YouTube channel,
// // ... such as video uploads, channel information, comments, and other YouTube API functionalities applicable to that channel.

// // From https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw
// const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';
//
// // TODO: Replace with your newly generated YouTube API Key by "https://console.cloud.google.com/apis/credentials?project=flutter-youtube-app-387705"
// const youTubeApiKey = 'AIzaSyA761Hm5jisuM9Vloo8GSUOfCzyY0unRfg';
//
// final _router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (context, state) {
//         return const Playlists();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: 'playlist/:id',
//           builder: (context, state) {
//             final title = state.queryParameters['title']!;
//             final id = state.pathParameters['id']!;
//             return PlaylistDetails(
//               playlistId: id,
//               playlistName: title,
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );
//
// void main() {
//   if (youTubeApiKey == 'AIzaNotAnApiKey') {
//     print('youTubeApiKey has not been configured.');
//     exit(1);
//   }
//
//   runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
//     create: (context) => FlutterDevPlaylists(
//       flutterDevAccountId: flutterDevAccountId,
//       youTubeApiKey: youTubeApiKey,
//     ),
//     child: const PlaylistsApp(),
//   ));
// }
//
// class PlaylistsApp extends StatelessWidget {
//   const PlaylistsApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'FlutterDev Playlists',
//       theme: FlexColorScheme.light(
//         scheme: FlexScheme.red,
//         useMaterial3: true,
//       ).toTheme,
//       darkTheme: FlexColorScheme.dark(
//         scheme: FlexScheme.red,
//         useMaterial3: true,
//       ).toTheme,
//       themeMode: ThemeMode.dark, // Or ThemeMode.System if you'd prefer
//       debugShowCheckedModeBanner: false,
//       routerConfig: _router,
//     );
//   }
// }



// ...........................................................................

// {{{{{{{{{{{{{{{ ... ... ...  Adapting to Desktop Screen ... ... ... }}}}}}}}}}}}}}}}}}}}}}

// ...........................................................................



import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'src/adaptive_playlists.dart';
import 'src/app_state.dart';
import 'src/playlist_details.dart';

// Typically, when integrating YouTube API into a Flutter application, you need to specify the 'YouTube account ID' to fetch or manipulate data related to that account.
// The account ID represents a unique identifier for a YouTube channel or user.
// In this case, 'flutterDevAccountId' is set to the YouTube account ID 'UCwXdFgeE9KYzlDdR7TG9cMw'
//  It refers to the YouTube channel associated with the Flutter development team on YouTube.
//  The account ID identifies the channel where the Flutter development team uploads their official Flutter-related videos, tutorials, announcements, and other content.
// By using this account ID in the Flutter YouTube API integration, you can access and retrieve data specifically related to the Flutter development team's YouTube channel,
// ... such as video uploads, channel information, comments, and other YouTube API functionalities applicable to that channel.

// From https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw , we get the following channel ID thus you can only provide either your personal channel's id or an open source ID like this example.
// But mostly the id's are hidden by the channel owners and id's are like 'https://www.youtube.com/@TheFlutterWay' thus you cannot extract the channel id because it is hidden behind '@TheFlutterWay'
const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';

// TODO: Replace with your newly generated YouTube API Key by "https://console.cloud.google.com/apis/credentials?project=flutter-youtube-app-387705"
const youTubeApiKey = 'AIzaSyA761Hm5jisuM9Vloo8GSUOfCzyY0unRfg';

final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const AdaptivePlaylists();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'playlist/:id',
          builder: (context, state) {
            final title = state.queryParameters['title']!;
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text(title)),
              body: PlaylistDetails(
                playlistId: id,
                playlistName: title,
              ),
            );
          },
        ),
      ],
    ),
  ],
);

void main() {
  if (youTubeApiKey == 'AIzaNotAnApiKey') {
    print('youTubeApiKey has not been configured.');
    exit(1);
  }

  runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
    create: (context) => FlutterDevPlaylists(
      flutterDevAccountId: flutterDevAccountId,
      youTubeApiKey: youTubeApiKey,
    ),
    child: const PlaylistsApp(),
  ));
}

class PlaylistsApp extends StatelessWidget {
  const PlaylistsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterDev Playlists',
      theme: FlexColorScheme.light(
        scheme: FlexScheme.red,
        useMaterial3: true,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.red,
        useMaterial3: true,
      ).toTheme,
      themeMode: ThemeMode.dark, // Or ThemeMode.System if you'd prefer
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}