// Logger mixin
mixin LoggerMixin {
  void logDebug(String message) {
    print('[DEBUG] ${runtimeType.toString()}: $message');
  }

  void logInfo(String message) {
    print('[INFO] ${runtimeType.toString()}: $message');
  }

  void logWarning(String message) {
    print('[WARNING] ${runtimeType.toString()}: $message');
  }

  void logError(String message) {
    print('[ERROR] ${runtimeType.toString()}: $message');
  }
}

// Abstract class representing various media items
abstract class MediaItem {
  late String title;
  late String artist;
}

// Interface for playable media items
abstract class Playable {
  void play();
}

// Concrete class representing a song
class Song extends MediaItem with LoggerMixin implements Playable {
  var title;
  var artist;

  Song(this.title, this.artist);

  @override
  void play() {
    logInfo('Playing song: $title by $artist');
    // Logic to play the song
  }
}

// Concrete class representing an album
class Album extends MediaItem with LoggerMixin implements Playable {
  List<Song> songs;
  String title;
  String artist;

  Album(this.title, this.artist, this.songs);

  @override
  void play() {
    logInfo('Playing album: $title by $artist');
    // Logic to play the album (play all songs in sequence)
    songs.forEach((song) => song.play());
  }
}

// Concrete class representing a playlist
class Playlist extends MediaItem with LoggerMixin implements Playable {
  List<MediaItem> items;
  String title;

  Playlist(this.title, this.items);

  @override
  void play() {
    logInfo('Playing playlist: $title');
    // Logic to play the playlist (play each item in sequence)
    items.forEach((item) {
      if (item is Playable) {
        (item as Playable).play();
      } else {
        logWarning('Item $item is not playable.');
      }
    });
  }
}

void main() {
  // Sample usage
  var song1 = Song('Song 1', 'Artist 1');
  var song2 = Song('Song 2', 'Artist 2');
  var album = Album('Album 1', 'Artist A', [song1, song2]);
  var playlist = Playlist('My Playlist', [song1, album]);

  playlist.play();
}
