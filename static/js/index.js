var streaming = false,
	video       = document.querySelector('#video'),
	canvas		= document.querySelector('#canvas'),
	startbutton = document.querySelector('#startbutton'),
  resetbutton = document.querySelector('#resetbutton'),
  thisphoto = document.querySelector('#thisphoto'),
  nextphoto = document.querySelector('#nextphoto'),
  donebutton = document.querySelector('#donebutton'),
  photoholderwall = document.querySelector('#photoholderwall'),
  photowall = document.querySelector('#photowall'),
  photowallimg = document.querySelector('#photowallimg'),
  timeremaining = document.querySelector('#timeremaining'),
  photoprogress = document.querySelector('#photoprogress'),
  progressmeter = document.querySelector('#progressmeter'),
  progressmeterbox = document.querySelector('#progressmeterbox'),
  lefthandside = document.querySelector('#lefthandside'),
  uuid = document.querySelector("#uuid"),
	width = 320,
	height = 0,
  delay = 1000;

var moods = ['Happy', 'Angry', 'Sad', 'Disgusted', 'Scared', 'Silly', 'Surprised', 'Bored', 'Flirty'];

navigator.getMedia = (
	navigator.getUserMedia ||
	navigator.webkitGetUserMedia ||
	navigator.mozGetUserMedia ||
	navigator.msGetUserMedia);

navigator.getMedia(
    {
      video: true,
    },
    function(stream) {
      if (navigator.getUserMedia) {
        video.src = stream;
      } else if (navigator.mozGetUserMedia) {
        video.mozSrcObject = stream;
      } else {
        var vendorURL = window.URL || window.webkitURL;
        video.src = vendorURL.createObjectURL(stream);
      }
      video.play();
      startbutton.style.display = "block";
    },
    function(err) {
      console.log("An error occured! " + err);
    }
);

// errBack = function(error) {
//   console.log("Capture error: " + error);
// }

// var videoObj = { "video": true };

// window.addEventListener("DOMContentLoaded", function() {
//   if(navigator.getUserMedia) {
//     navigator.getUserMedia(videoObj, function(stream) {
//       video.src = stream;
//       video.play();
//     }, errBack);
//   } else if (navigator.webkitGetUserMedia) {
//     navigator.webkitGetUserMedia(videoObj, function(stream) {
//       video.src = window.webkitURL.createObjectURL(stream);
//       video.play();
//     }, errBack);
//   } else if (navigator.mozGetUserMedia) {
//     navigator.mozGetUserMedia(videoObj, function(stream) {
//       video.src = window.URL.createObjectURL(stream);
//       video.play();
//     }, errBack);
//   }
// }, false);

video.addEventListener('canplay', function(ev){
    if (!streaming) {
      height = video.videoHeight / (video.videoWidth/width);
      video.setAttribute('width', width);
      video.setAttribute('height', height);
      canvas.setAttribute('width', width);
      canvas.setAttribute('height', height);
      streaming = true;
    }
}, false);

function takepicture(counter) {
    canvas.width = width;
    canvas.height = height;
    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    var data = canvas.toDataURL('image/png');
    var photo = document.querySelector('#photo' + counter);
    photo.style.backgroundImage = "url("+data+")";
    if (counter == 8) {
      donebutton.style.display = "block";
      nextphoto.style.display = "none";
    } else {
      thisphoto.innerHTML = moods[counter+1];
    }
}

function callbackgenerator(count) {
  return function() {
    takepicture(count);
  }
}

function timergenerator(time) {
  return function() {
    timeremaining.innerHTML = 3 - (time % 3) ;
  }
}

startbutton.addEventListener('click', function(){
    startbutton.style.display = "none";
    resetbutton.style.display = "block";
    thisphoto.innerHTML = moods[0];
    for (var i=0; i<moods.length; i++) {
      setTimeout(callbackgenerator(i), (i+1)*delay*3);
    }
    for (var j=0; j<moods.length*3; j++) {
      setTimeout(timergenerator(j), j*delay);
    }
}, false);

function uploadPhoto(counter) {
  var photo = document.querySelector('#photo' + counter).style.backgroundImage;
  var photocode = photo.slice(26, photo.length - 1);
  fd = new FormData();
  fd.append('image', photocode);
  fd.append('key', uuid.value);
  fd.append('counter', counter);

  xhr = new XMLHttpRequest();
  xhr.open('POST', '/uploadphoto');
  xhr.addEventListener('error', function(ev) {
    console.log('Upload Error!');
  }, false);
  xhr.addEventListener('load', function(ev) {
      var response = JSON.parse(xhr.responseText);
      if (response.status == 101) {
        console.log(response.message);
      }
      if (response.status == 201) {
        uploadPhoto(counter+1);
        photoprogress.innerHTML = counter+1;
        progressmeter.setAttribute('aria-valuenow', counter+1);
        progressmeter.style.width = (100*(counter+1)/9) + '%';
      }
      if (response.status == 301) {
        photoprogress.innerHTML = counter+1;
        progressmeter.setAttribute('aria-valuenow', counter+1);
        progressmeter.style.width = (100*(counter+1)/9) + '%';
        photoholderwall.style.display = 'none';
        lefthandside.style.display = 'none';
        photowallimg.src = response.url;
        photowall.style.display = "block";
      }
  }, false);
  xhr.send(fd);
}

donebutton.addEventListener('click', function() {
  donebutton.style.display = "none";
  progressmeterbox.style.display = "block";
  uploadPhoto(0);
}, false);

resetbutton.addEventListener('click', function() {
  window.location.reload();
}, false);