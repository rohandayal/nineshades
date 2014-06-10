<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <title>Nine Shades of Me</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Why take one selfie when you can take nine?">
    <meta name="author" content="Nine Shades of Me">
    <meta property="fb:app_id" content="1432549800348429" /> 
    <meta property="og:site_name" content="nineshadesofme" />
    <meta property="og:title" content="Nine Shades of Me" /> 
    <meta property="og:url" content="http://9shades-rdtest.rhcloud.com/" /> 
    <meta property="og:description" content="Nine Shades of Me - Why take one selfie when you can take 9?" /> 
    <meta property="og:type" content="website" /> 

    <style type="text/css">
      #video {
        margin-left: auto;
        margin-right: auto;
        display: block;
      }
      #startbutton, .resetbutton {
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
        margin-bottom: 30px;
        position: relative;
      }
      #thisphoto {
        font-size: 30px;
        font-weight: bold;
        text-align: left;
      }
      #timeremaining {
        font-size: 30px;
        font-weight: bold;
        text-align: right;
      }
      #errorbox {
        display: none;
      }
      #errordetails {
        color: #BBBBBB;
      }
      #photoholderwall {
        margin-bottom: 40px;
      }
      #photowallimg {
        max-width: 100%;
        max-height: 600px;
      }
      .footer {
        position: fixed;
        bottom: 0px;
        left: 0px;
        width: 100%;
      }
      .footertab {
        width: 11.1111111%;
        float: left;
        height: 20px;
      }
      #first { background: #FFFF00; }
      #second { background: #FF0000; }
      #third { background: #8B4513; }
      #fourth { background: #32CD32; }
      #fifth { background: #00B0F0; }
      #sixth { background: #FFA500; }
      #seventh { background: #9370DB; }
      #eighth { background: #A6A6A6; }
      #ninth { background: #FF69B4; }
    </style>
  </head>
  <body>
    <div id="fb-root"></div>
    <input type="hidden" value="{{ uuid }}" id="uuid" />
    <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Nine Shades of Me</a>
      </div>
    </header>
    <div class="container" style="margin-top: 70px;">
      <div class="row">
        <div class="col-xs-12 col-sm-6" style="position: relative; text-align: center;" id="lefthandside">
          <button id="startbutton" class="btn btn-primary">Start</button>
          <button class="resetbutton btn btn-danger" id="resetbutton0">Restart</button>
          <table class="table" id="nextphoto">
            <tr>
              <td id="thisphoto"></td>
              <td id="timeremaining"></td>
            </tr>
          </table>
          <video id="video" preload="none" src="" width="320" height="240"></video>
          <div id="errorbox">Error!<br><br>Your browser does not support images or your device camera is not available. Please try again (click allow/share when prompted or use a different browser).<br><br><span id="errordetails"></span></div>
        </div>
        <div class="col-xs-12 col-sm-6"
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
          <table style="width: 50%; margin-left: auto; margin-right: auto;">
            <tr>
              <td style="vertical-align: middle; text-align: right; padding-right: 20px;">
                <div class="fb-share-button" data-href="http://9shades-rdtest.rhcloud.com/myshade/{{ uuid }}.png" data-width="200" data-type="button"></div>
              </td>
              <td style="vertical-align: middle; text-align: left; padding-left: 20px;">
                <button class="resetbutton btn btn-danger" id="resetbutton1" style="display: inline-block;">Restart</button>
              </td>
            </tr>
          </table>
          <img id="photowallimg" />
        </div>
      </div>
    </div>
    <div class="footer">
      <div id="first" class="footertab"></div>
      <div id="second" class="footertab"></div>
      <div id="third" class="footertab"></div>
      <div id="fourth" class="footertab"></div>
      <div id="fifth" class="footertab"></div>
      <div id="sixth" class="footertab"></div>
      <div id="seventh" class="footertab"></div>
      <div id="eighth" class="footertab"></div>
      <div id="ninth" class="footertab"></div>
    </div>
    <canvas id="canvas"></canvas>
    
    <div class="modal fade" id="instructions">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Nine Shades of Me</h4>
          </div>
          <div class="modal-body">
            <h5 style="font-style: italic;">Why take one selfie when you can take 9?</h5>
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
    <script>
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=1432549800348429&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
</script>
  </body>
</html>