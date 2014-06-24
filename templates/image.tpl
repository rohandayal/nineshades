<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <title>Nine Shades of Me</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Why take one selfie when you can take nine?">
    <meta name="author" content="Nine Shades of Me">
    <meta property="fb:app_id" content="1432549800348429" /> 
    <meta property="og:image" content="http://9shades-rdtest.rhcloud.com/myshade/{{ uuid }}.jpg" />
    <meta property="og:site_name" content="nineshadesofme" />
    <meta property="og:title" content="Nine Shades of Me" /> 
    <meta property="og:description" content="Nine Shades of Me - Why take one selfie when you can take 9?" /> 
    <meta property="og:type" content="website" /> 
    <style type="text/css">
      #photowall {
        text-align: center;
        margin-bottom: 30px;
        position: relative;
      }
      #photowallimg {
        max-width: 100%;
        max-height: 600px;
      }
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
        <div class="col-xs-12" id="photowall">
          <table style="width: 50%; margin-left: auto; margin-right: auto;">
            <tr>
              <td style="vertical-align: middle; text-align: right; padding-right: 20px;">
                <div class="fb-share-button" data-href="http://9shades-rdtest.rhcloud.com/nineshades/{{ uuid }}" data-width="200" data-type="button"></div>
              </td>
              <td style="vertical-align: middle; text-align: left; padding-left: 20px;">
                <button class="resetbutton btn btn-danger" id="resetbutton1" style="display: inline-block;">Capture Your Own Nine Shades!</button>
              </td>
            </tr>
          </table>
          <img id="photowallimg" src="http://9shades-rdtest.rhcloud.com/myshade/{{ uuid }}.jpg" />
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