// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// class AudioPlayerUrl extends StatefulWidget {
//   final String url;

//   const AudioPlayerUrl({required this.url, Key? key}) : super(key: key);

//   @override
//   _AudioPlayerUrlState createState() => _AudioPlayerUrlState();
// }

// class _AudioPlayerUrlState extends State<AudioPlayerUrl> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   PlayerState audioPlayerState = PlayerState.paused; // Change here
//   String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3';

//   @override
//   void initState() {
//     super.initState();

//     audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
//       setState(() {
//         audioPlayerState = state;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   playMusic() async {
//     await audioPlayer.play(url);
//   }

//   pauseMusic() async {
//     await audioPlayer.pause();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               iconSize: 50,
//               onPressed: () {
//                 audioPlayerState == PlayerState.playing // Change here
//                     ? pauseMusic()
//                     : playMusic();
//               },
//               icon: Icon(audioPlayerState == PlayerState.playing // Change here
//                   ? Icons.pause_rounded
//                   : Icons.play_arrow_rounded),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
