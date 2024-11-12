function playVideo(videoSrc, title) {
  const video = document.getElementById("main-video");
  const videoTitle = document.getElementById("video-title");
  
  video.src = videoSrc;
  videoTitle.textContent = title;
  video.play();
}
