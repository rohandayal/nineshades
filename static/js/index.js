var streaming = false,
	video       = document.querySelector('#video'),
	canvas		= document.querySelector('#canvas'),
	init = document.querySelector('#init'),
  startbutton = document.querySelector('#startbutton'),
  resetbutton0 = document.querySelector('#resetbutton0'),
  resetbutton1 = document.querySelector('#resetbutton1'),
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
  errorbox = document.querySelector('#errorbox'),
  errordetails = document.querySelector('#errordetails'),
  lefthandside = document.querySelector('#lefthandside'),
  uuid = document.querySelector("#uuid"),
  fbshare = document.querySelector("#fbshare"),
  modalbody = document.querySelector("#modalbody"),
  timerslider = document.querySelector("#timerslider"),
  timerslidercontainer = document.querySelector("#timerslidercontainer"),
  timervalue = document.querySelector("#timervalue"),
	width = 320,
	height = 0;

var allphotos = document.getElementsByClassName('photo');

var moods = ['Happy', 'Angry', 'Sad', 'Disgusted', 'Scared', 'Silly', 'Surprised', 'Bored', 'Flirty'];

var delay = parseInt(timerslider.value);

navigator.getMedia = (
	navigator.getUserMedia ||
	navigator.webkitGetUserMedia ||
	navigator.mozGetUserMedia ||
	navigator.msGetUserMedia);

function errorCallback(err) {
  errordetails.innerHTML = err;
  video.style.display = "none";
  errorbox.style.display = "block";
}

if (navigator.getMedia) {
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
        init.style.visibility = "visible";
      },
      function(err) {
        errorCallback(err);
      }
  );
} else {
  errorCallback("Browser not supported");
}

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

function setAttributes() {
  height = video.videoHeight / (video.videoWidth/width);
  video.setAttribute('width', width);
  video.setAttribute('height', height);
  canvas.setAttribute('width', width);
  canvas.setAttribute('height', height);
  streaming = true;
}

video.addEventListener('canplay', function(ev){
  setTimeout(setAttributes, 2000);
}, false);

function retakegenerator(counter) {
  return function() {
    nextphoto.style.visibility = "visible";
    thisphoto.innerHTML = moods[counter];
    setTimeout(callbackgenerator(counter, true), delay*1000);
    for (var j=0; j<delay; j++) {
      setTimeout(timergenerator(j), j*1000);
    }
  }
}

function takepicture(counter) {
    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    var photo = document.querySelector('#photo' + counter);
    var data = canvas.toDataURL('image/jpg');
    photo.style.backgroundImage = "url("+data+")";
    if (counter == 8) {
      donebutton.style.display = "block";
      nextphoto.style.visibility = "hidden";
      for (var i=0; i<allphotos.length; i++) {
        allphotos[i].addEventListener('click', retakegenerator(i));
      }
    } else {
      thisphoto.innerHTML = moods[counter+1];
    }
}

function callbackgenerator(count, retake) {
  return function() {
    takepicture(count);
    if (retake) {
      nextphoto.style.visibility = "hidden";
    }
  }
}

function timergenerator(time) {
  return function() {
    timeremaining.innerHTML = delay - time;
    if (time>(delay-3)) {
      timeremaining.style.color = "#FF0000";
    } else {
      timeremaining.style.color = "#000000";
    }
  }
}

startbutton.addEventListener('click', function(){
    timerslidercontainer.style.display = "none";
    nextphoto.style.visibility = "visible";
    startbutton.style.display = "none";
    resetbutton0.style.display = "block";
    thisphoto.innerHTML = moods[0];
    for (var i=0; i<moods.length; i++) {
      setTimeout(callbackgenerator(i, false), (i+1)*delay*1000);
      for (var j=0; j<delay; j++) {
        setTimeout(timergenerator(j), (delay*i+j)*1000);
      }
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
  progressmeterbox.style.display = "inline-block";
  uploadPhoto(0);
}, false);

resetbutton0.addEventListener('click', function() {
  window.location.reload();
}, false);

resetbutton1.addEventListener('click', function() {
  window.location.reload();
}, false);

timerslider.addEventListener('change', function() {
  timervalue.innerHTML = timerslider.value;
  delay = parseInt(timerslider.value);
}, false);

function showCommentPopup() {
  modalbody.innerHTML = "<h5>Add a custom message:</h5><textarea id='caption' placeholder='....'></textarea><div style='width: 100%; text-align: right; margin-top: 20px;'><button id='submitcaption' class='btn btn-primary'>Share</button></div>";
  $('#instructions').modal({show: true});
  var submitcaption = document.querySelector('#submitcaption');
  var caption = document.querySelector('#caption');
  submitcaption.addEventListener('click', function() {
    caption.disabled = true;
    submitcaption.disabled = true;
    var postjson = {
      message: caption.value,
      caption: "My nine shades",
      url: 'http://9shades-rdtest.rhcloud.com/myshade/' + uuid.value + '.jpg'
    };
    FB.api('/me/photos', 'post', postjson, function(response) {
      if (response.error) {
        alert("There was an error sharing on Facebook. Please try again.");
        caption.disabled = false;
        submitcaption.disabled = false;
      } else {
        modalbody.innerHTML = "Your nine shades image has been shared and is available at <a href='https://www.facebook.com/me/photos_all'>your Facebook images page</a>.";
      }
    });
  }, false);
}

fbshare.addEventListener('click', function() {
  FB.login(function(response){
    if (response.status == "connected") {
      showCommentPopup();
    }
  }, {scope: 'publish_actions'});
}, false);