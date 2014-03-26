<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : videochat
    Created on : 25/03/2014, 21:58:38
    Author     : antonibertranbellido
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
	<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Videochat - Recorder</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/general.css">
        <script type="text/javascript" src="FlashRTMPPlayer/AC_RunActiveContent.js" ></script>
	</head>	
    <body>
    	<!-- modal que apareix al carregar la pàgina-->
    	<div class="modal fade" id="camera">
            <div class="modal-dialog">
            	<div class="modal-content">
            		<div class="modal-header">
            			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            			<h4 class="modal-title">Camera</h4>
            		</div>
            		<div class="modal-body">
            			<p>This is your private webcam signal.<br/><strong>Click on activate camera</strong> when you are ready to dend it to this session.</p>
            		</div>
            		<div class="modal-footer">
            			<button type="button" class="btn btn-warning">Activate camera</button>
            		</div>
            	</div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        <!-- modal parar gravació-->
    	<div class="modal fade" id="camera">
            <div class="modal-dialog">
            	<div class="modal-content">
            		<div class="modal-header">
            			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            			<h4 class="modal-title">Important</h4>
            		</div>
            		<div class="modal-body">
            			<p><strong>This session is being recorded, what do you want to do?</strong></p>
                        <div>Cancel: This session continues recording<br/>
                        	 Stop: Stop this recording and reconnect to decide what to do, save or repeat</div>
                             <div>Save: Archive and close this session, it will be published on videochat</div>
                        
            		</div>
            		<div class="modal-footer">
            			<button type="button" class="btn btn-warning">Cancel</button>
                        <button type="button" class="btn btn-warning">Stop</button>
                        <button type="button" class="btn btn-warning">Save and close</button>
            		</div>
            	</div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
    	<div class="container">
        	<header class="row">
            	<div class="col-md-4"><img src="css/images/logo.png" alt="videochat"/></div>
                <div id="idiomes" class="col-md-3 col-md-offset-4">
                    <select class="form-control">
                      <option>English</option>
                      <option>Catalan</option>
                      <option>Spanish</option>
                      <option>Polish</option>
                      <option>Dutch</option>
                      <option>Swedish</option>
                      <option>Irish</option>
                    </select>
                </div>
                <div id="close" class="col-md-1">
                    <span class="glyphicon glyphicon-remove"></span>
                </div>
            </header>
            <h3>Videoconference Recorder Amazon LTI</h3>
            <div class="row wrapper_buttons">	
                <div class="col-md-3 col-xs-7">
                	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#record"><span class="glyphicon glyphicon-record"></span> RECORD</button>
                    <!-- modal del botó RECORD -->
                                <div class="modal fade" id="record">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title">Important</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div><strong>Are you sure you want to start a new recorder?</strong></div>
                                                <div>If you continue the previously made recording will be deleted.</div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" data-dismiss="modal" class="btn btn-default">Cancel</button>
                                                <button type="button" class="btn btn-warning">Continue</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div>
        						<!-- END modal del botó RECORD -->
                    <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-volume-up"></span></button>
                </div>
                <div class="col-md-2 col-md-offset-7 col-xs-5">
                	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#archive"><span class="glyphicon glyphicon-save"></span> ARCHIVE & CLOSE</button>
                    <!-- modal del botó RECORD -->
                    <div class="modal fade" id="archive">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Important</h4>
                                </div>
                                <div class="modal-body">
                                    <div><strong>Are you sure you want to archive and close the last recording made?</strong></div>
                                    <div>If you want to continue you will not be able to make more recordings within this session.</div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <button type="button" class="btn btn-warning">Continue</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div>
                    <!-- END modal del botó RECORD -->
                </div>
            </div>
            <div class="row wrapper_content">
            	<div class="col-md-8 participants">
                	<div class="my-inner">
                        <div class="row header_participants">
                            <h4 class="col-md-10 col-xs-6">Participants</h4>
                            <div class="btn-group col-md-2 col-xs-6">
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-repeat"></span></button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span></button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 participant" id="user-1">
                                <div class="participant_content">
                                    <div id="nom"><c:out value="${user}"/></div>
                                    <!--script>
            
                /*if (AC_FL_RunContent == 0) {
                    alert("This page requires AC_RunActiveContent.js.");
                } else {
                    AC_FL_RunContent(
                                     'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
                                     'width', '160',
                                     'height', '110',
                                     'src', 'FlashRTMPPlayer/recorder',
                                     'quality', 'high',
                                     'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
                                     'align', 'middle',
                                     'play', 'true',
                                     'loop', 'true',
                                     'scale', 'showall',
                                     'wmode', 'window',
                                     'devicefont', 'false',
                                     'id', 'recorder',
                                     'bgcolor', '#ffffff',
                                     'name', 'recorder',
                                     'menu', 'true',
                                     'allowFullScreen', 'true',
                                     'allowScriptAccess','sameDomain',
                                     'movie', 'FlashRTMPPlayer/recorder',
                                     'rmtpServer', 'rtmp://184.73.205.58/videochat',
                                     'debug', '0',
                                     'publishName', 'uoc.edu-resourcekey-id_room-username',
                                     'salign', ''
                                     ); //end AC code
                }
                */
        </script-->
                <embed width="215" height="138" src="FlashRTMPPlayer/recorder.swf?debug=0&publishName=uoc.edu-resourcekey-id_room-username&rmtpServer=rtmp://184.73.205.58/videochat" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" align="middle" play="true" loop="true" scale="showall" wmode="window" devicefont="false" bgcolor="#ffffff" name="recorder" menu="true" allowfullscreen="true" allowscriptaccess="sameDomain" salign="" type="application/x-shockwave-flash"> 
            <noscript>
                &lt;object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="636" height="360" id="recorder" align="middle"&gt;
                    &lt;param name="allowScriptAccess" value="sameDomain" /&gt;
                    &lt;param name="allowFullScreen" value="true" /&gt;
                    &lt;param name="debug" value="0" /&gt;
                    &lt;param name="rmtpServer" value="rtmp://184.73.205.58/videochat" /&gt;
                    &lt;param name="publishName" value="uoc.edu-resourcekey-id_room-username" /&gt;
                    &lt;param name="movie" value="FlashRTMPPlayer/recorder.swf" /&gt;&lt;param name="quality" value="high" /&gt;&lt;param name="bgcolor" value="#ffffff" /&gt;  &lt;embed src="FlashRTMPPlayer/recorder.swf" quality="high" bgcolor="#ffffff" width="160" height="110" name="recorder" align="middle" allowScriptAccess="sameDomain" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /&gt;
                &lt;/object&gt;
            </noscript>
                                </div>
                            </div>
                            <div class="col-md-4 participant" id="user-2">
                                <div class="participant_content">
                                    <div id="nom">Nom</div>
                                    <img src="css/images/participant.png" alt="participant 4">
                                </div>
                            </div>
                            <div class="col-md-4 participant" id="user-3">
                                <div class="participant_content">
                                    <div id="nom">Nom</div>
                                    <img src="css/images/participant.png" alt="participant 4">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 participant" id="user-4">
                            	<div class="participant_content">
                                    <div id="nom">Nom</div>
                                    <img src="css/images/participant.png" alt="participant 4">
                                </div>
                            </div>
                            <div class="col-md-4 participant" id="user-5">
                            	<div class="participant_content">
                                    <div id="nom">Nom</div>
                                    <img src="css/images/participant.png" alt="participant 5">
                                </div>
                            </div>
                            <div class="col-md-4 participant" id="user-6">
                            	<div class="participant_content">
                                    <div id="nom">Nom</div>
                                    <img src="css/images/participant.png" alt="participant 6">
                                </div>
                            </div>
                        </div>
                    </div>
              	</div>
                <div class="col-md-4 aside">
                	<div class="my-inner">
                    	<div class="header_chat row">
                			<h4>Chat</h4>
                    	</div>
                        <div class="wrapper_chat">
                        	<p>15:16:42 -  Admin SpeakApps - -- Locked Room --</p>
                            <p>15:16:45 -  Admin SpeakApps - -- unLocked Room --</p>
                            <p>16:15:09 -  Admin SpeakApps - dadad</p>
                        </div> 
                        <p>Enter your text here:</p>
                        <textarea class="form-control" rows="2"></textarea>	
                    </div>
                </div>
            </div>
        </div>  
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script>
			$( document ).ready(function() {
				//$('#camera').modal('show');
				//$('.participant > div > div').css("visibility", "hidden");
               
				
			});
		</script>
    </body>
</html>