/*! Code to allow skipping to specific timestamps in embedded YouTube players; from https://stackoverflow.com/questions/42060604/with-embedded-youtube-video-create-link-that-jumps-to-specific-time */
var player;
var ytSeconds = 0;

jQuery(document).ready(function ()
    {
    player = new YT.Player('yt-embed', {events: {
      'onStateChange': onPlayerStateChange
      }
      });
    });

function onPlayerStateChange(e)
{
  if (e.data == 1 && ytSeconds > 0) {
    e.target.seekTo(ytSeconds);
    ytSeconds = 0;
  }
}

function seekTo(seconds)
{
  if (player.getPlayerState() == 1) {
    player.seekTo(seconds);
  }
  else {
    ytSeconds = seconds;
    player.playVideo();
  }
}