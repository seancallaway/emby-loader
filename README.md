# emby-loader
Renames and moves media files for Emby

Requires [FileBot](http://filebot.net) for polling TheTVDB and TheMovieDB. This, in turn, requires Java 8. We will be 
including this in our releases.

These scripts are intended to be run as regular cron jobs, watching a particular directory for new media, then 
processing them and moving them to an appropriate location in Emby's library.

### Name Formats

The NAME_FORMAT variable in each script uses the Filebot [naming scheme](http://www.filebot.net/naming.html) to 
properly format the specific path and name of the file.

By default, TV shows are named as follows: "{n}{'/Season '+s}/{n} {s00e00}". Using the 
[Firefly pilot](http://www.thetvdb.com/?tab=episode&seriesid=78874&seasonid=15791&id=297989&lid=7) as an example, this 
would translate to "Firefly/Season 1/Firefly S01E01".

Movies are named as follows: "{genres[0]}/{n} ({y})". Using [Serenity](http://www.themoviedb.org/movie/16320-serenity) 
as an example, this would translate to "Science Fiction/Serenity (2005)".

Both of these formats are well-received by Emby.

### TV Show Loader Options

**FILEBOT_PATH** - The full path to Filebot CLI.

**SAVE_PATH** - The root directory of your Emby TV show library.

**LOAD_PATH** - The folder to scan for new TV show files.

### Movie Loader Options

**FILEBOT_PATH** - The full path to Filebot CLI.

**SAVE_PATH** - The root directory of your Emby movie library.

**LOAD_PATH** - The folder to scan for new movie files.

