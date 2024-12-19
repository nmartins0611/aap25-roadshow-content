// function playVideo(videoSrc, title) {
//   const video = document.getElementById("main-video");
//   const videoTitle = document.getElementById("video-title");
  
//   video.src = videoSrc;
//   videoTitle.textContent = title;
//   video.play();
// }

function playVideo(videoSrc, videoTitle) {
  var videoElement = document.getElementById("main-video");
  var titleElement = document.getElementById("video-title");

  // Change the video source and title
  videoElement.src = videoSrc;
  titleElement.textContent = videoTitle;

  // Play the video
  videoElement.play();
}
