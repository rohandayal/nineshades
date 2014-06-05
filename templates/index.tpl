<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <title>NineShades of Me</title>
    <style type="text/css">
      body {
        background-image:url("/static/img/dark-tile.gif");
        background-repeat:repeat;
      }
      #video {
        margin-left: auto;
        margin-right: auto;
        display: block;
      }
      #startbutton, #resetbutton {
        margin-left: auto;
        margin-right: auto;
        display: none;
        margin-bottom: 20px;
      }
      #canvas {
        display: none;
      }
      #nextphoto {
        margin-top: 20px;
        margin-left: auto;
        margin-right: auto;
        width: 320px;
        height: 59px;
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
        background: #FFFFFF;
        margin-bottom: 20px;
      }
      #photowall {
        display: none;
        text-align: center;
      }
      #thisphoto {
        font-size: 30px;
        font-weight: bold;
        color: white;
        text-align: left;
      }
      #timeremaining {
        font-size: 30px;
        font-weight: bold;
        color: white;
        text-align: right;
      }
    </style>
  </head>
  <body>
    <input type="hidden" value="{{ uuid }}" id="uuid" />
    <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Nine Shades of Me</a>
      </div>
    </header>
    <div class="container" style="margin-top: 100px;">
      <div class="row">
        <div class="col-xs-12 col-sm-6" style="position: relative; text-align: center;" id="lefthandside">
          <button id="startbutton" class="btn btn-primary">Start</button>
          <button id="resetbutton" class="btn btn-danger">Restart</button>
          <table class="table" id="nextphoto">
            <tr>
              <td id="thisphoto"></td>
              <td id="timeremaining"></td>
            </tr>
          </table>
          <video id="video" autoplay src="" width="320" height="240"></video>
        </div>
        <div class="col-xs-12 col-sm-6" id="photoholderwall">
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
            <div class="phototype">Silly</div>
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
          <div class="col-xs-12" id="progressmeterbox" style="display: none;">
            <div class="progress progress-striped active" style="width: 100%; margin-top: 20px;">
              <div class="progress-bar" id="progressmeter" role="progress-bar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="9" style="width: 0%;"><span id="photoprogress">0</span> of 9 images uploaded</div> 
            </div>
          </div>
        </div>
        <div class="col-xs-12" id="photowall">
          <img style="height: 300px;" id="photowallimg" />
          <div style="width: 100%; text-align: center;">Your image is ready to share!</div>
        </div>
      </div>
    </div>
    <canvas id="canvas"></canvas>
    
    <div class="modal fade" id="instructions">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Why take one selfie when you can take 9?</h4>
          </div>
          <div class="modal-body">
            <h5>Instructions:</h5>
            <ol>
              <li>Your browser or phone may ask for permission to access the camera. Click on allow. On your mobile, select the front facing camera.</li>
              <li>For best results, be in a well-lit place and position your face as close to the center of the live image as possible.</li>
              <li>Click on begin and prepare your look - a selfie will be taken every 3 seconds.</li>
              <li>If you don't like the results, click on Restart to begin again.</li>
              <li>Click on Done to generate your Nine Shades collage.</li>
              <li>Share/download/use in your own way. The collage belongs to you :)</li>
            </ol>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/index.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
        $('#instructions').modal({show: true})
      });
    </script>
  </body>
</html>