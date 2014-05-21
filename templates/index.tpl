<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <title>NineShades of you</title>
    <style type="text/css">
      #video {
        margin-left: auto;
        margin-right: auto;
        display: block;
      }
      #startbutton {
        margin-left: auto;
        margin-right: auto;
        display: block;
      }
      #canvas {
        display: none;
      }
      .photo {
        width: 100%;
        height: 100px;
        background-image: url(static/img/unknown_user.png);
        background-size: cover;
        background-position: center center;
        background-repeat: no-repeat;
      }
      .phototype {
        width: 100%;
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-6" style="position: relative; text-align: center;">
          <video id="video"></video>
          <button id="startbutton" class="btn btn-primary">Take photo</button>
        </div>
        <div class="col-xs-12 col-sm-6">
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo0"></div>
            <div class="phototype">Happy</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo1"></div>
            <div class="phototype">Angry</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo2"></div>
            <div class="phototype">Sad</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo3"></div>
            <div class="phototype">Disgusted</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo4"></div>
            <div class="phototype">Scared</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo5"></div>
            <div class="phototype">Guilty</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo6"></div>
            <div class="phototype">Surprised</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo7"></div>
            <div class="phototype">Bored</div>
          </div>
          <div class="photoholder col-xs-4">
            <div class="photo" id="photo8"></div>
            <div class="phototype">Flirty</div>
          </div>
          <div class="col-xs-12" id="donebutton" style="text-align: center; display: none;">
            <button class="btn btn-primary">Done</button>
          </div>
        </div>
    </div>
    <canvas id="canvas"></canvas>
    <script type="text/javascript" src="static/js/index.js">
    </script>
  </script>