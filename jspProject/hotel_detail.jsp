<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
	String star1 = "&#9733;";
	String star2 = "&#9734;";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>야호놀자</title>
 <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
 <link rel="stylesheet" type="text/css" href="<%=cp %>jspProject/css/slidemenu.css"/>
  <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="<%=cp %>/jspProject/css/login.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link href="https://a0.muscache.com/airbnb/static/packages/dls/dls-lite_cereal-d9f6fdb2a0dd4a18c37f8ee01de8ec3d.css" rel="stylesheet" type="text/css" media="all"/>
  <style>
  	.center { position:relative;}
  	.center button {display: none;}
  	.center button.slick-prev {
  	left:50px; font-size:0; color:transparent;
  	position:absolute; z-index:10; top:50%; transform:translateY(-50%);
  	width:100px; height:100px; border-radius:100%; background:rgba(248,49,118,.5); border:none;}
  	.center button.slick-prev:before {content:"\e93b"; font-family:'xeicon'; color:#fff; font-size:50px;}
  	.center button.slick-next {
  	right:50px; font-size:0; color:transparent;
  	position:absolute; z-index:10; top:50%; transform:translateY(-50%);
  	width:100px; height:100px; border-radius:100%; background:rgba(248,49,118,.5); border:none;}
  	.center button.slick-next:before {content:"\e93e"; font-family:'xeicon'; color:#fff; font-size:50px;}
  	.center ul {list-style: none;} 
  	
  	.fade { position:relative;}
  	.fade button {display: none;}
  	.fade button.slick-prev {
  	left:50px; font-size:0; color:transparent;
  	position:absolute; z-index:10; top:50%; transform:translateY(-50%);
  	width:100px; height:100px; border-radius:100%; background:rgba(248,49,118,.5); border:none;}
  	.fade button.slick-prev:before {content:"\e93b"; font-family:'xeicon'; color:#fff; font-size:50px;}
  	.fade button.slick-next {
  	right:50px; font-size:0; color:transparent;
  	position:absolute; z-index:10; top:50%; transform:translateY(-50%);
  	width:100px; height:100px; border-radius:100%; background:rgba(248,49,118,.5); border:none;}
  	.fade button.slick-next:before {content:"\e93e"; font-family:'xeicon'; color:#fff; font-size:50px;}
  	.fade ul {list-style: none;}  
  		
  	html {
    height: 100%;
    width: 100%;
	}	
	#fcolor {
	 color: rgb(248,48,156);
	}
	#fixedbtn{
		position:fixed;
		right:100px;
		bottom:100px;
		z-index:1000
	}
	
  </style>
<style data-aphrodite="true">
._16grqhk{position:relative !important;min-height:100vh !important;}._siy8gh{display:none !important;}@media (min-width: 744px){._siy8gh{display:block !important;}}._xca6kx{display:block !important;}@media (min-width: 744px){._xca6kx{display:none !important;}}._1gw6tte::before{display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;content:'' !important;}._1gw6tte::after{display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;content:'' !important;}._m3x2dvr{height:80px !important;position:fixed !important;left:0px !important;width:100% !important;z-index:100 !important;--header-brand-color:#FF385C !important;}._m3x2dvr::before{background-image:-webkit-linear-gradient(to bottom, #000, rgba(0, 0, 0, 0)) !important;background-image:-moz-linear-gradient(to bottom, #000, rgba(0, 0, 0, 0)) !important;background-image:linear-gradient(to bottom, #000, rgba(0, 0, 0, 0)) !important;content:"" !important;height:140% !important;left:0px !important;opacity:0 !important;pointer-events:none !important;position:absolute !important;top:0px !important;-webkit-transition:opacity 0.3s cubic-bezier(0.35, 0, 0.65, 1) !important;-moz-transition:opacity 0.3s cubic-bezier(0.35, 0, 0.65, 1) !important;transition:opacity 0.3s cubic-bezier(0.35, 0, 0.65, 1) !important;width:100% !important;z-index:0 !important;}@media (prefers-reduced-motion: reduce){._m3x2dvr::before{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._m3x2dvr::after{background:#FFFFFF !important;box-shadow:0px 1px 2px rgba(0, 0, 0, 0.18) !important;content:"" !important;height:100% !important;left:0px !important;position:absolute !important;top:0px !important;-webkit-transition:opacity 0.3s cubic-bezier(0.35, 0, 0.65, 1) !important;-moz-transition:opacity 0.3s cubic-bezier(0.35, 0, 0.65, 1) !important;transition:opacity 0.3s cubic-bezier(0.35, 0, 0.65, 1) !important;width:100% !important;z-index:0 !important;opacity:1 !important;}@media (prefers-reduced-motion: reduce){._m3x2dvr::after{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._3cn8q53{-webkit-box-align:center !important;-ms-flex-align:center !important;-webkit-align-items:center !important;align-items:center !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;height:100% !important;position:relative !important;width:100% !important;z-index:1 !important;max-width:1440px !important;padding-left:24px !important;padding-right:24px !important;margin:0 auto !important;}@supports(--a:a){._3cn8q53{max-width:var(--page-shell-max-content-width, 1440px) !important;}}@media (min-width: 375px){._3cn8q53{padding-left:24px !important;padding-right:24px !important;}}@media (min-width: 744px){._3cn8q53{padding-left:40px !important;padding-right:40px !important;}}@media (min-width: 950px){._3cn8q53{padding-left:40px !important;padding-right:40px !important;}}@media (min-width: 1128px){._3cn8q53{padding-left:80px !important;padding-right:80px !important;}}@media (min-width: 1440px){._3cn8q53{padding-left:80px !important;padding-right:80px !important;}}._1fmnqpr{-webkit-flex:1 1 auto !important;-ms-flex:1 1 auto !important;flex:1 1 auto !important;min-width:0px !important;padding:0 24px !important;text-align:center !important;}._qkr85q{height:80px !important;}._o6689fn{-webkit-box-align:center !important;-ms-flex-align:center !important;outline:none !important;-webkit-align-items:center !important;align-items:center !important;display:-webkit-inline-box !important;display:-moz-inline-box !important;display:-ms-inline-flexbox !important;display:-webkit-inline-flex !important;display:inline-flex !important;height:80px !important;position:relative !important;vertical-align:middle !important;z-index:1 !important;color:#FF385C !important;}._o6689fn::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._o6689fn:focus::-moz-focus-inner{border:none !important;}._o6689fn:-moz-focusring{outline:none !important;}._o6689fn::before{border-radius:12px !important;bottom:8px !important;content:"" !important;left:-8px !important;position:absolute !important;right:-8px !important;top:8px !important;}._o6689fn:focus-visible::before{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px #222222, 0px 0px 0px 4px #FFFFFF !important;}@media (prefers-reduced-motion: reduce){._o6689fn:focus-visible::before{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._o6689fn:focus[data-focus-visible-added]::before{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px #222222, 0px 0px 0px 4px #FFFFFF !important;}@media (prefers-reduced-motion: reduce){._o6689fn:focus[data-focus-visible-added]::before{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1grlqto{display:none !important;}@media (min-width: 1128px){._1grlqto{display:block !important;}}@media (min-width: 1128px){._17ctt5{display:none !important;}}._vuzcgs{-webkit-box-pack:end !important;-ms-flex-pack:end !important;-webkit-box-align:center !important;-ms-flex-align:center !important;position:relative !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-align-items:center !important;align-items:center !important;-webkit-justify-content:flex-end !important;justify-content:flex-end !important;height:80px !important;}._w2q1b8{display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;margin-right:8px !important;}._1x6o0b9n{-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;cursor:pointer !important;display:inline-block !important;font-family:inherit !important;font-size:14px !important;font-weight:600 !important;line-height:18px !important;margin:0px !important;outline:none !important;overflow:visible !important;padding:12px !important;text-align:inherit !important;text-decoration:none !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;position:relative !important;white-space:nowrap !important;z-index:1 !important;color:#222222 !important;}._1x6o0b9n::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._1x6o0b9n:focus::-moz-focus-inner{border:none !important;}._1x6o0b9n:-moz-focusring{outline:none !important;}._1x6o0b9n::before{border-radius:22px !important;bottom:0px !important;content:"" !important;left:-3px !important;position:absolute !important;right:-3px !important;top:0px !important;z-index:0 !important;}._1x6o0b9n:focus-visible{z-index:2 !important;}._1x6o0b9n:focus-visible::before{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px #222222, 0px 0px 0px 4px #FFFFFF !important;}@media (prefers-reduced-motion: reduce){._1x6o0b9n:focus-visible::before{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1x6o0b9n:focus[data-focus-visible-added]{z-index:2 !important;}._1x6o0b9n:focus[data-focus-visible-added]::before{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px #222222, 0px 0px 0px 4px #FFFFFF !important;}@media (prefers-reduced-motion: reduce){._1x6o0b9n:focus[data-focus-visible-added]::before{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1x6o0b9n:hover::before{background:#F7F7F7 !important;}._iglww7{-webkit-box-align:center !important;-ms-flex-align:center !important;-webkit-align-items:center !important;align-items:center !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;height:100% !important;position:relative !important;z-index:1 !important;}._1ubw29{position:relative !important;display:inline !important;}._z5mecy{-webkit-box-align:center !important;-ms-flex-align:center !important;-webkit-align-items:center !important;align-items:center !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;height:18px !important;position:relative !important;z-index:1 !important;}._xpkakx{margin-right:6px !important;}._13nrx0e3{background:#FFFFFF !important;border-radius:12px !important;box-shadow:0px 2px 16px rgba(0, 0, 0, 0.12) !important;color:#222222 !important;display:none !important;margin-top:34px !important;padding:8px 0 !important;position:absolute !important;top:50% !important;right:0px !important;max-height:-webkit-calc(100vh - 100px) !important;max-height:-moz-calc(100vh - 100px) !important;max-height:calc(100vh - 100px) !important;overflow-y:auto !important;z-index:2 !important;min-width:185px !important;}._13nrx0e3:target{display:block !important;}._13nrx0e3:target + [href="#"]{cursor:default !important;height:100% !important;left:0px !important;position:fixed !important;top:0px !important;width:100% !important;z-index:1 !important;}._2wzhk5{margin-right:8px !important;text-align:center !important;width:16px !important;}._11s0u3u3{-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;color:#222222 !important;cursor:pointer !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;font-family:inherit !important;font-size:14px !important;font-weight:600 !important;line-height:18px !important;margin:0px !important;outline:none !important;overflow:visible !important;padding:12px 16px !important;text-align:inherit !important;text-decoration:none !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;white-space:nowrap !important;width:100% !important;}._11s0u3u3::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._11s0u3u3:focus::-moz-focus-inner{border:none !important;}._11s0u3u3:-moz-focusring{outline:none !important;}._11s0u3u3:hover:not(:active){background-color:#F7F7F7 !important;}._11s0u3u3:focus-visible{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:inset 0px 0px 0px 2px #222222 !important;}@media (prefers-reduced-motion: reduce){._11s0u3u3:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._11s0u3u3:focus[data-focus-visible-added]{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:inset 0px 0px 0px 2px #222222 !important;}@media (prefers-reduced-motion: reduce){._11s0u3u3:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._ojs7nk{-webkit-flex:1 0 auto !important;-ms-flex:1 0 auto !important;flex:1 0 auto !important;}._167wsvl{display:inline !important;position:relative !important;}._1usxwsg6{-webkit-box-align:center !important;-ms-flex-align:center !important;-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:1px solid #DDDDDD !important;color:#222222 !important;cursor:pointer !important;display:-webkit-inline-box !important;display:-moz-inline-box !important;display:-ms-inline-flexbox !important;display:-webkit-inline-flex !important;display:inline-flex !important;font-family:inherit !important;font-size:inherit !important;font-weight:inherit !important;line-height:inherit !important;margin:0px !important;outline:none !important;overflow:visible !important;padding:5px 5px 5px 12px !important;text-align:inherit !important;text-decoration:none !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;-webkit-align-items:center !important;align-items:center !important;background-color:#FFFFFF !important;border-radius:21px !important;height:42px !important;position:relative !important;vertical-align:middle !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;z-index:1 !important;}._1usxwsg6::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._1usxwsg6:focus::-moz-focus-inner{border:none !important;}._1usxwsg6:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._1usxwsg6{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1usxwsg6:focus-visible{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px #222222, 0px 0px 0px 4px #FFFFFF !important;}@media (prefers-reduced-motion: reduce){._1usxwsg6:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1usxwsg6:focus[data-focus-visible-added]{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px #222222, 0px 0px 0px 4px #FFFFFF !important;}@media (prefers-reduced-motion: reduce){._1usxwsg6:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1usxwsg6:hover{box-shadow:0px 2px 4px rgba(0, 0, 0, 0.18) !important;}._1sfnwgq{color:#717171 !important;-webkit-flex:0 0 30px !important;-ms-flex:0 0 30px !important;flex:0 0 30px !important;height:30px !important;margin-left:12px !important;overflow:hidden !important;position:relative !important;width:30px !important;z-index:1 !important;}._1g865qv3{background:#FFFFFF !important;border-radius:12px !important;box-shadow:0px 2px 16px rgba(0, 0, 0, 0.12) !important;color:#222222 !important;display:none !important;margin-top:34px !important;padding:8px 0 !important;position:absolute !important;top:50% !important;right:0px !important;max-height:-webkit-calc(100vh - 100px) !important;max-height:-moz-calc(100vh - 100px) !important;max-height:calc(100vh - 100px) !important;overflow-y:auto !important;z-index:2 !important;min-width:240px !important;}._1g865qv3:target{display:block !important;}._1g865qv3:target + [href="#"]{cursor:default !important;height:100% !important;left:0px !important;position:fixed !important;top:0px !important;width:100% !important;z-index:1 !important;}._apke5g{background:#DDDDDD !important;margin:8px 0 !important;height:1px !important;}._f5rco33{-webkit-appearance:none !important;-moz-appearance:none !important;appearance:none !important;background:transparent !important;border:0px !important;color:#222222 !important;cursor:pointer !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;font-family:inherit !important;font-size:14px !important;font-weight:400 !important;line-height:18px !important;margin:0px !important;outline:none !important;overflow:visible !important;padding:12px 16px !important;text-align:inherit !important;text-decoration:none !important;-webkit-user-select:auto !important;-moz-user-select:auto !important;-ms-user-select:auto !important;user-select:auto !important;white-space:nowrap !important;width:100% !important;}._f5rco33::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._f5rco33:focus::-moz-focus-inner{border:none !important;}._f5rco33:-moz-focusring{outline:none !important;}._f5rco33:hover:not(:active){background-color:#F7F7F7 !important;}._f5rco33:focus-visible{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:inset 0px 0px 0px 2px #222222 !important;}@media (prefers-reduced-motion: reduce){._f5rco33:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._f5rco33:focus[data-focus-visible-added]{-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:inset 0px 0px 0px 2px #222222 !important;}@media (prefers-reduced-motion: reduce){._f5rco33:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1oc06va{margin:16px -20px !important;}._1oc06va:after{content:"" !important;margin:-4px 20px 0 !important;display:block !important;border-bottom:1px solid #DDDDDD !important;}._1u9fru1{display:none !important;}._wex4o5{font-size:26px !important;line-height:30px !important;font-weight:800 !important;margin-bottom:24px !important;color:#222222 !important;}@media (min-width: 744px){._wex4o5{font-size:32px !important;line-height:36px !important;}}._xfv3yi0{margin:0 auto !important;max-width:1600px !important;margin-top:36px !important;padding-bottom:65px !important;padding-left:24px !important;padding-right:24px !important;}@media (min-width: 375px){._xfv3yi0{padding-left:24px !important;padding-right:24px !important;}}@media (min-width: 744px){._xfv3yi0{padding-left:40px !important;padding-right:40px !important;}}@media (min-width: 950px){._xfv3yi0{padding-left:40px !important;padding-right:40px !important;}}@media (min-width: 1128px){._xfv3yi0{padding-left:80px !important;padding-right:80px !important;}}@media (min-width: 1440px){._xfv3yi0{padding-left:80px !important;padding-right:80px !important;}}._14i3z6h{color:inherit !important;font-size:1em !important;font-weight:inherit !important;line-height:inherit !important;margin:0px !important;padding:0px !important;}._14i3z6h:focus{outline:0px !important;}._1828yr1x{cursor:pointer !important;text-align:center !important;text-decoration:none !important;border-width:1px !important;border-style:solid !important;border-color:black !important;width:auto !important;padding-top:4px !important;padding-bottom:4px !important;padding-left:8px !important;padding-right:8px !important;color:black !important;font-family:inherit !important;-ms-touch-action:manipulation !important;touch-action:manipulation !important;font-size:14px !important;line-height:18px !important;position:relative !important;background:transparent !important;display:inline-block !important;padding:16px !important;margin:4px !important;font-weight:600 !important;border:none !important;}._1828yr1x:focus-visible{outline:none !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0 0 0 2px #FFFFFF, 0 0 0 4px #222222 !important;}._1828yr1x:focus-visible::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._1828yr1x:focus-visible:focus::-moz-focus-inner{border:none !important;}._1828yr1x:focus-visible:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._1828yr1x:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1828yr1x:focus[data-focus-visible-added]{outline:none !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0 0 0 2px #FFFFFF, 0 0 0 4px #222222 !important;}._1828yr1x:focus[data-focus-visible-added]::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._1828yr1x:focus[data-focus-visible-added]:focus::-moz-focus-inner{border:none !important;}._1828yr1x:focus[data-focus-visible-added]:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._1828yr1x:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._1828yr1x:disabled{cursor:not-allowed !important;opacity:0.3 !important;}@media (min-width: 744px){._1828yr1x{font-size:16px !important;line-height:20px !important;}}._1828yr1x:focus{outline:none !important;}._1828yr1x:after{content:"" !important;display:block !important;padding-top:16px !important;margin-bottom:-16px !important;border-width:0 0 2px !important;border-style:solid !important;border-color:#222222 !important;-webkit-border-image:#222222 2px !important;border-image:#222222 2px !important;}._ixon9hs{cursor:pointer !important;text-align:center !important;text-decoration:none !important;border-width:1px !important;border-style:solid !important;border-color:black !important;width:auto !important;padding-top:4px !important;padding-bottom:4px !important;padding-left:8px !important;padding-right:8px !important;font-family:inherit !important;-ms-touch-action:manipulation !important;touch-action:manipulation !important;font-size:14px !important;line-height:18px !important;position:relative !important;background:transparent !important;display:inline-block !important;padding:16px !important;margin:4px !important;font-weight:600 !important;border:none !important;color:#717171 !important;}._ixon9hs:focus-visible{outline:none !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0 0 0 2px #FFFFFF, 0 0 0 4px #222222 !important;}._ixon9hs:focus-visible::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._ixon9hs:focus-visible:focus::-moz-focus-inner{border:none !important;}._ixon9hs:focus-visible:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._ixon9hs:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._ixon9hs:focus[data-focus-visible-added]{outline:none !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0 0 0 2px #FFFFFF, 0 0 0 4px #222222 !important;}._ixon9hs:focus[data-focus-visible-added]::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._ixon9hs:focus[data-focus-visible-added]:focus::-moz-focus-inner{border:none !important;}._ixon9hs:focus[data-focus-visible-added]:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._ixon9hs:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._ixon9hs:hover{background:#F7F7F7 !important;color:#222222 !important;}._ixon9hs:active{background:#F7F7F7 !important;color:#222222 !important;}._ixon9hs:disabled{cursor:not-allowed !important;opacity:0.3 !important;background:#FFFFFF !important;color:#DDDDDD !important;}@media (min-width: 744px){._ixon9hs{font-size:16px !important;line-height:20px !important;}}._ixon9hs:focus{outline:none !important;}._1ir6ymk{font-size:14px !important;line-height:18px !important;}._gzog035{font-size:inherit !important;font-family:inherit !important;font-style:inherit !important;font-variant:inherit !important;line-height:inherit !important;color:#222222 !important;text-decoration:underline !important;border-radius:4px !important;font-weight:600 !important;outline:none !important;}._gzog035:focus{color:inherit !important;text-decoration:underline !important;}._gzog035:visited{color:#717171 !important;text-decoration:underline !important;}._gzog035:hover{cursor:pointer !important;color:#000000 !important;text-decoration:underline !important;}._gzog035:active{color:#717171 !important;text-decoration:underline !important;}._gzog035::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._gzog035:focus::-moz-focus-inner{border:none !important;}._gzog035:-moz-focusring{outline:none !important;}._gzog035:focus-visible{color:#222222 !important;text-decoration:underline !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px rgb(255,255,255), 0px 0px 0px 4px #222222 !important;}@media (prefers-reduced-motion: reduce){._gzog035:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._gzog035:focus[data-focus-visible-added]{color:#222222 !important;text-decoration:underline !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px rgb(255,255,255), 0px 0px 0px 4px #222222 !important;}@media (prefers-reduced-motion: reduce){._gzog035:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._gzog035:disabled{color:#DDDDDD !important;text-decoration:underline !important;}._gzog035:disabled:hover{text-decoration:underline !important;}._j2g2cc{padding:0 0 32.93413173652694% !important;position:relative !important;height:auto !important;width:100% !important;margin-top:16px !important;margin-bottom:16px !important;}._y6l2f9{position:absolute !important;top:0px !important;left:0px !important;height:auto !important;width:100% !important;}._m095vcq{cursor:pointer !important;display:inline-block !important;margin:0px !important;position:relative !important;text-align:center !important;text-decoration:none !important;border-color:black !important;width:auto !important;-ms-touch-action:manipulation !important;touch-action:manipulation !important;font-family:Circular,-apple-system,BlinkMacSystemFont,Roboto,Helvetica Neue,sans-serif !important;font-size:16px !important;line-height:20px !important;font-weight:600 !important;border-radius:8px !important;border-width:1px !important;border-style:solid !important;outline:none !important;padding-top:14px !important;padding-bottom:14px !important;padding-left:24px !important;padding-right:24px !important;-webkit-transition:box-shadow 0.2s ease, -webkit-transform 0.1s ease, transform 0.1s ease !important;-moz-transition:box-shadow 0.2s ease, transform 0.1s ease !important;transition:box-shadow 0.2s ease, -ms-transform 0.1s ease, -webkit-transform 0.1s ease, transform 0.1s ease !important;border:none !important;background:#222222 !important;color:#FFFFFF !important;}._m095vcq:focus-visible{outline:none !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px rgba(255,255,255,.8), 0px 0px 0px 4px #222222 !important;}._m095vcq:focus-visible::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._m095vcq:focus-visible:focus::-moz-focus-inner{border:none !important;}._m095vcq:focus-visible:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._m095vcq:focus-visible{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._m095vcq:focus[data-focus-visible-added]{outline:none !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;box-shadow:0px 0px 0px 2px rgba(255,255,255,.8), 0px 0px 0px 4px #222222 !important;}._m095vcq:focus[data-focus-visible-added]::-moz-focus-inner{border:none !important;padding:0px !important;margin:0px !important;}._m095vcq:focus[data-focus-visible-added]:focus::-moz-focus-inner{border:none !important;}._m095vcq:focus[data-focus-visible-added]:-moz-focusring{outline:none !important;}@media (prefers-reduced-motion: reduce){._m095vcq:focus[data-focus-visible-added]{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._m095vcq:hover{border:none !important;background:#000000 !important;color:#FFFFFF !important;}._m095vcq:active{-webkit-transform:scale(0.96) !important;-ms-transform:scale(0.96) !important;transform:scale(0.96) !important;border:none !important;background:#000000 !important;color:#FFFFFF !important;}._m095vcq:disabled{cursor:not-allowed !important;opacity:1 !important;border:none !important;background:#DDDDDD !important;color:#FFFFFF !important;}@media (prefers-reduced-motion: reduce){._m095vcq{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._f68cfc{-webkit-box-pack:start !important;-ms-flex-pack:start !important;-webkit-box-lines:multiple !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-wrap:wrap !important;-ms-flex-wrap:wrap !important;flex-wrap:wrap !important;-webkit-justify-content:flex-start !important;justify-content:flex-start !important;list-style-type:none !important;margin:-5px !important;padding:0px !important;}._gcfn5x{display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;margin-bottom:24px !important;width:100% !important;}@media (min-width: 744px){._gcfn5x{margin:0px 11px 22px !important;width:-webkit-calc(50% - 11px) !important;width:-moz-calc(50% - 11px) !important;width:calc(50% - 11px) !important;}._gcfn5x:nth-child(2n + 1){margin-left:0px !important;}._gcfn5x:nth-child(2n + 2){margin-right:0px !important;}}@media (min-width: 1128px){._gcfn5x{width:-webkit-calc(33.333333333333336% - 14.666666666666666px) !important;width:-moz-calc(33.333333333333336% - 14.666666666666666px) !important;width:calc(33.333333333333336% - 14.666666666666666px) !important;}._gcfn5x:nth-child(2n + 1){margin-left:11px !important;}._gcfn5x:nth-child(2n + 2){margin-right:11px !important;}._gcfn5x:nth-child(3n + 1){margin-left:0px !important;}._gcfn5x:nth-child(3n + 3){margin-right:0px !important;}}._1hfu0v{width:50% !important;}._1khnujv{background-color:#DDDDDD !important;height:100% !important;position:absolute !important;width:100% !important;z-index:1 !important;}._1ln866w{font-size:14px !important;line-height:18px !important;margin-bottom:3px !important;}._1ch9oqq{padding:5px !important;position:relative !important;width:100% !important;}._znbf64{-webkit-box-direction:normal !important;-webkit-box-orient:vertical !important;font-size:14px !important;line-height:18px !important;color:#222222 !important;background-color:#FFFFFF !important;border-radius:12px !important;box-shadow:0px 6px 16px rgba(0, 0, 0, 0.12) !important;height:100% !important;overflow:hidden !important;width:100% !important;z-index:0 !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-direction:column !important;-ms-flex-direction:column !important;flex-direction:column !important;-webkit-transition:box-shadow 0.2s ease !important;-moz-transition:box-shadow 0.2s ease !important;transition:box-shadow 0.2s ease !important;}@media (prefers-reduced-motion: reduce){._znbf64{-webkit-transition:none !important;-moz-transition:none !important;transition:none !important;}}._znbf64:hover{box-shadow:0px 6px 20px rgba(0, 0, 0, 0.20) !important;}._znbf64:focus-within{box-shadow:0px 6px 20px rgba(0, 0, 0, 0.20) !important;}._1uwpj50{height:180px !important;position:relative !important;}._vwngzr{-webkit-box-direction:normal !important;-webkit-box-orient:vertical !important;-webkit-box-flex:1 !important;-ms-flex-positive:1 !important;z-index:1 !important;-webkit-flex-grow:1 !important;flex-grow:1 !important;padding-left:24px !important;padding-right:24px !important;margin-bottom:24px !important;margin-top:24px !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-direction:column !important;-ms-flex-direction:column !important;flex-direction:column !important;}._15rw9so{font-size:12px !important;line-height:16px !important;color:#717171 !important;margin-top:1px !important;}._1o0eau5{font-size:22px !important;line-height:26px !important;max-height:52px !important;overflow:hidden !important;text-overflow:ellipsis !important;display:-webkit-box !important;-webkit-line-clamp:2 !important;-webkit-box-orient:vertical !important;font-weight:600 !important;margin-top:4px !important;margin-bottom:6px !important;}@keyframes keyframe_1vunhnd{from{opacity:0.1;}to{opacity:0.3;}}._8fcfxy9{-webkit-animation-direction:alternate !important;animation-direction:alternate !important;-webkit-animation-duration:1s !important;animation-duration:1s !important;-webkit-animation-fill-mode:forwards !important;animation-fill-mode:forwards !important;-webkit-animation-iteration-count:infinite !important;animation-iteration-count:infinite !important;-webkit-animation-name:keyframe_1vunhnd !important;animation-name:keyframe_1vunhnd !important;-webkit-animation-timing-function:ease-in-out !important;animation-timing-function:ease-in-out !important;background-color:currentColor !important;position:relative !important;display:block !important;}@media (prefers-reduced-motion: reduce){._8fcfxy9{-webkit-animation:none !important;animation:none !important;opacity:0.1 !important;}}._1vdcswu{-webkit-animation-direction:alternate !important;animation-direction:alternate !important;-webkit-animation-duration:1s !important;animation-duration:1s !important;-webkit-animation-fill-mode:forwards !important;animation-fill-mode:forwards !important;-webkit-animation-iteration-count:infinite !important;animation-iteration-count:infinite !important;-webkit-animation-name:keyframe_1vunhnd !important;animation-name:keyframe_1vunhnd !important;-webkit-animation-timing-function:ease-in-out !important;animation-timing-function:ease-in-out !important;background-color:currentColor !important;display:inline-block !important;position:relative !important;}@media (prefers-reduced-motion: reduce){._1vdcswu{-webkit-animation:none !important;animation:none !important;opacity:0.1 !important;}}._lpvrtk{line-height:0 !important;}._jxme2c7{padding:16px 24px !important;background-color:#ffffff !important;border-radius:0px !important;box-shadow:0 -1px 0 0 rgba(72, 72, 72, 0.16) !important;position:relative !important;display:none !important;}@media (min-width: 744px){._jxme2c7{max-width:100% !important;position:fixed !important;z-index:1 !important;border:1px solid #EBEBEB !important;border-radius:2px !important;box-shadow:0 1px 4px 0 rgba(0, 0, 0, 0.05) !important;width:375px !important;bottom:24px !important;left:24px !important;}}@media (max-width: 743px){._jxme2c7{max-width:100% !important;position:fixed !important;z-index:1 !important;bottom:0px !important;left:0px !important;width:100% !important;}}._12d0llg5{-webkit-box-align:center !important;-ms-flex-align:center !important;-webkit-box-lines:multiple !important;text-align:justify !important;line-height:0 !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-wrap:wrap !important;-ms-flex-wrap:wrap !important;flex-wrap:wrap !important;-webkit-align-items:center !important;align-items:center !important;}._12d0llg5::after{content:'' !important;display:inline-block !important;vertical-align:top !important;width:100% !important;}._1o9fub0v{-ms-flex-preferred-size:100% !important;-webkit-box-flex:1 !important;-ms-flex-positive:1 !important;display:inline-block !important;vertical-align:middle !important;text-align:left !important;-webkit-flex-grow:1 !important;flex-grow:1 !important;-webkit-flex-basis:100% !important;flex-basis:100% !important;}._1iti0ju{display:inline-block !important;vertical-align:middle !important;}._hgs47m{display:table !important;width:100% !important;border-spacing:0px !important;}._n5lh69r{display:table-cell !important;width:100% !important;vertical-align:top !important;}._1thk0tsb{display:table-cell !important;vertical-align:top !important;}._98kere2{cursor:pointer !important;background-color:transparent !important;color:buttontext !important;border:0px !important;display:inline-block !important;}._98kere2:active{outline:0px !important;}._98kere2:disabled{opacity:0.5 !important;cursor:default !important;color:graytext !important;}._1tywmry{background-color:#F7F7F7 !important;border-top:1px solid #DDDDDD !important;}._1s94zl78{padding-left:24px !important;padding-right:24px !important;margin:0 auto !important;max-width:1440px !important;}@media (min-width: 375px){._1s94zl78{padding-left:24px !important;padding-right:24px !important;}}@media (min-width: 744px){._1s94zl78{padding-left:40px !important;padding-right:40px !important;}}@media (min-width: 950px){._1s94zl78{padding-left:40px !important;padding-right:40px !important;}}@media (min-width: 1128px){._1s94zl78{padding-left:80px !important;padding-right:80px !important;}}@media (min-width: 1440px){._1s94zl78{padding-left:80px !important;padding-right:80px !important;}}@supports(--a:a){._1s94zl78{max-width:var(--page-shell-max-content-width, 1440px) !important;}}._fyxf74{padding:32px 0 !important;}@media (min-width: 744px){._fyxf74{-webkit-box-direction:normal !important;-webkit-box-orient:vertical !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-direction:column !important;-ms-flex-direction:column !important;flex-direction:column !important;padding-top:40px !important;padding-bottom:40px !important;}}@media (min-width: 1128px){._fyxf74{-webkit-box-direction:normal !important;-webkit-box-orient:horizontal !important;-webkit-flex-direction:row !important;-ms-flex-direction:row !important;flex-direction:row !important;padding-top:48px !important;padding-bottom:48px !important;margin-left:-12px !important;margin-right:-12px !important;}}._1wsqynx{padding-top:24px !important;padding-bottom:24px !important;border-top:1px solid #DDDDDD !important;}._1l3ys1i:not(:last-child){padding-bottom:24px !important;margin-bottom:24px !important;border-bottom:1px solid #DDDDDD !important;}@media (min-width: 1128px){._1l3ys1i{-webkit-flex:1 0 0% !important;-ms-flex:1 0 0% !important;flex:1 0 0% !important;padding-left:12px !important;padding-right:12px !important;}._1l3ys1i:not(:last-child){padding-bottom:0px !important;margin-bottom:0px !important;border-bottom:0px !important;}}._tfslnm{color:#222222 !important;text-transform:uppercase !important;font-size:12px !important;margin-bottom:0px !important;}._yuolfv{list-style:none !important;margin:0px !important;padding:0px !important;}@media (min-width: 744px){._yuolfv{-webkit-box-lines:multiple !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-wrap:wrap !important;-ms-flex-wrap:wrap !important;flex-wrap:wrap !important;margin-left:-12px !important;margin-right:-12px !important;}}@media (min-width: 1128px){._yuolfv{display:block !important;margin-left:0px !important;margin-right:0px !important;}}._wmuyow{margin-top:12px !important;}@media (min-width: 744px){._wmuyow{-ms-flex-preferred-size:33.333333333333336% !important;-webkit-flex-basis:33.333333333333336% !important;flex-basis:33.333333333333336% !important;padding-left:12px !important;padding-right:12px !important;}}@media (min-width: 1128px){._wmuyow{margin-top:16px !important;padding-left:0px !important;padding-right:0px !important;}}._o06542u{font-family:inherit !important;font-weight:inherit !important;font-style:inherit !important;font-variant:inherit !important;text-decoration:none !important;color:#222222 !important;font-size:14px !important;line-height:18px !important;}._o06542u:hover{cursor:pointer !important;color:inherit !important;text-decoration:underline !important;}._o06542u:focus{color:inherit !important;text-decoration:underline !important;}._1tu1axq{-webkit-box-direction:normal !important;-webkit-box-orient:vertical !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;-webkit-flex-direction:column !important;-ms-flex-direction:column !important;flex-direction:column !important;}@media (min-width: 744px){._1tu1axq{-webkit-box-align:center !important;-ms-flex-align:center !important;-webkit-align-items:center !important;align-items:center !important;text-align:center !important;}}@media (min-width: 1128px){._1tu1axq{-webkit-box-pack:justify !important;-ms-flex-pack:justify !important;-webkit-box-align:stretch !important;-ms-flex-align:stretch !important;-webkit-box-direction:reverse !important;-webkit-box-orient:horizontal !important;text-align:left !important;-webkit-flex-direction:row-reverse !important;-ms-flex-direction:row-reverse !important;flex-direction:row-reverse !important;-webkit-align-items:stretch !important;align-items:stretch !important;-webkit-justify-content:space-between !important;justify-content:space-between !important;}}._1m14l43{display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;margin-bottom:16px !important;}@media (min-width: 1128px){._1m14l43{margin-bottom:0px !important;}}._2ms5qb{display:none !important;}@media (min-width: 744px){._2ms5qb{display:block !important;margin-left:32px !important;}}._zyu73r{-webkit-flex:1 1 0% !important;-ms-flex:1 1 0% !important;flex:1 1 0% !important;}@media (min-width: 1128px){._zyu73r{margin-right:40px !important;}}._jro6t0{display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;}._19c5bku:not(last-child){margin-right:24px !important;}._14tkmhr{margin-right:8px !important;}._bjxj6b{font-weight:600 !important;text-decoration:underline !important;}._1kejnocv{font-family:inherit !important;font-weight:inherit !important;font-style:inherit !important;font-variant:inherit !important;font-size:14px !important;line-height:18px !important;color:#222222 !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;white-space:nowrap !important;text-decoration:none !important;}._1kejnocv:hover{cursor:pointer !important;color:inherit !important;text-decoration:none !important;}._1kejnocv:focus{color:inherit !important;text-decoration:none !important;}._krjbj{border:0px !important;clip:rect(0 0 0 0) !important;-webkit-clip-path:inset(100%) !important;clip-path:inset(100%) !important;height:1px !important;overflow:hidden !important;padding:0px !important;position:absolute !important;white-space:nowrap !important;width:1px !important;}._115qwnm{list-style:none !important;margin:0px !important;padding:0px !important;display:-webkit-box !important;display:-moz-box !important;display:-ms-flexbox !important;display:-webkit-flex !important;display:flex !important;}._kdkpwk:not(:last-child){margin-right:24px !important;}._s7cvp1u{font-size:inherit !important;font-family:inherit !important;font-weight:inherit !important;font-style:inherit !important;font-variant:inherit !important;line-height:inherit !important;color:#222222 !important;text-decoration:none !important;}._s7cvp1u:hover{cursor:pointer !important;color:inherit !important;text-decoration:none !important;}._s7cvp1u:focus{color:inherit !important;text-decoration:none !important;}._j8ldew{display:none !important;}@media (min-width: 1128px){._j8ldew{display:inline-block !important;}}@media (min-width: 744px){._pd8gea{text-align:center !important;}}@media (min-width: 1128px){._pd8gea{text-align:left !important;}}@media (min-width: 1128px){._9q359r{overflow:hidden !important;}}._1br4kkl{font-size:14px !important;line-height:18px !important;color:#222222 !important;display:inline-block !important;}@media (min-width: 1128px){._1br4kkl{margin-right:19px !important;}}@media (min-width: 1128px){._opoa3c{display:inline-block !important;margin-left:-19px !important;}}._10wqwyj{display:inline-block !important;text-align:center !important;width:19px !important;}

	#fcolor {
	 color: rgb(248,48,156);
	}

</style>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>


<body>
<form action="" name="myForm" method="post">
<div data-application="true">
	<div dir="ltr">
		<div>
			<div style="--page-shell-max-content-width:1600px">
				<div class="_16grqhk">
					<div class="_siy8gh">
						<div class="_1gw6tte">
							<header class="_m3x2dvr">
							<div class="_3cn8q53">
							<div class="_3hmsj">
								<a class="_o6689fn" href="<%=cp %>/hotel/main.do"><h1><b>yahonolja</b></h1></a>	
							</div>
							<div align="right" id="right-box">
							<c:choose>
								<c:when test="${empty sessionScope.LoginInfo.dto }">
								<a href="<%=cp %>/user/login.do?type=0"><font id="fcolor" size="5pt">로그인</font></a>
								 </c:when>
								 <c:otherwise><font id="fcolor"><b>${sessionScope.LoginInfo.dto.userName }</b>님 안녕하세요.　</font>
								 	 <a href="<%=cp %>/user/logout_ok.do"><font id="fcolor"><b>로그아웃</b></font></a>
								 	 <c:if test="${sessionScope.LoginInfo.dto.type ==2}">
									 <a href="<%=cp %>/hotel/hotel_regit.do"><font id="fcolor"><b>/ 호텔등록 </b></font></a>
									 <a href="<%=cp %>/hotel/hotel_my.do?userId=${sessionScope.LoginInfo.dto.userId }"><font id="fcolor"><b>/ 나의호텔 </b></font></a>																	 
									 </c:if>
									 <c:if test="${sessionScope.LoginInfo.dto.type ==3}">
									 <a href="https://nid.naver.com/user2/help/myInfo.nhn?lang=ko_KR"><font id="fcolor"><b>/ 회원정보 /</b></font></a>
									 </c:if>								 		
									 <c:if test="${sessionScope.LoginInfo.dto.type !=3}">
									 <a href="<%=cp %>/user/user_update.do?userId=${sessionScope.LoginInfo.dto.userId }"><font id="fcolor"><b>/ 회원정보 /</b></font></a>
									 </c:if>
									 <c:if test="${sessionScope.LoginInfo.dto.type !=2}">
									  <a href="<%=cp %>/reserve/reserve_user.do?userId=${sessionScope.LoginInfo.dto.userId }"><font id="fcolor"><b> 예약정보 /</b></font></a>
									  </c:if>
									  <c:if test="${sessionScope.LoginInfo.dto.type ==2}">
									  <a href="<%=cp %>/reserve/reserve_hotel.do?userId=${sessionScope.LoginInfo.dto.userId }"><font id="fcolor"><b> 예약현황 /</b></font></a>
									  </c:if>
									    <c:if test="${sessionScope.LoginInfo.dto.type !=2}">
									   <a href="<%=cp %>/reserve/favorites.do?userId=${sessionScope.LoginInfo.dto.userId }"><font id="fcolor"><b> 즐겨찾기</b></font></a>
									   </c:if>
								 </c:otherwise>
							</c:choose>
							</div>
							</div>
							</div>
						
						</header><br/><br/><br/><br/><br/><br/><br/>
							<main>							
							<div id="fixedbtn">
							<c:if test="${sessionScope.LoginInfo.dto.type !=2}">
								<table>
									<tr>
										<td>
											<button type="button" class="submit-btn" onclick="loginC()">예약하기</button>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="submit-btn" onclick="loginC1()">즐겨찾기</button>
										</td>
									</tr>
								</table>
								</c:if>	
							</div>
							

							 <div align="center">
									 <h1>${hdto.hname }</h1>
									 <h3>${hdto.hloc }</h3>
									<section class="slider-for">									
									<%int i = 0; %>
									  <c:forEach var="i" begin="0" end="${fn:length(mainImg)-1}" step="1">
									  
									  <c:choose>
									  	<c:when test = "${not empty mainImg[i] }">
									  	<div>
									      <img width="640px" height="360px"
									      src="${resourcePath }/img/${num }/${mainImg[i] }" />
									    </div>
									   				    
									  	</c:when>
									  
									  <c:otherwise>
									  	<div>
									      <img width="640px" height="360px"
									      src="${resourcePath }/img/etc/noimg.gif" />
									    </div>
									  </c:otherwise>
									  
									  </c:choose>
									   </c:forEach>
									   <%i++; %>
									  </section>
							</div>


							
							 <div align="center">
									<section class="center">
									<%int j = 0; %>
									  <c:forEach var="j" begin="0" end="${fn:length(mainImg)-1}" step="1">
									  
									  <c:choose>
									  	<c:when test = "${not empty mainImg[j] }">
									  		<div>
									      	<img width="320px" height="180px"
									      	src="${resourcePath }/img/${num }/${mainImg[j] }" />									
									    	</div>
									  	</c:when>
									  	
									  <c:otherwise>
									  	<div>
									      <img width="320px" height="180px"
									      src="${resourcePath }/img/etc/noimg.gif" />
									    </div>
									  </c:otherwise>
									  </c:choose>
									   </c:forEach>
									   <%j++; %>
									  </section>
							</div>
							
							
							<c:if test="${not empty img1[0] }">
						    <div align="center">
						    	<h3>${list.get(0).roomType }</h3>
						      		<section class="fade">
									<%j = 0; %>
									<%String value = "1"; %>
									  <c:forEach var="j" begin="0" end="${fn:length(img1)-1}" step="1">
									  <c:choose>
									  	<c:when test = "${status eq 'find' }">
									  	<c:if test="${not empty img1[j] }">
									  		<div>
									      	<img width="960px" height="540px"
									      	src="${resourcePath }/img/${num }/${path[1] }/${img1[j] }" />
									    	</div>
									    </c:if>
									  	</c:when>
									  				  
									  </c:choose>
									   </c:forEach>
									   <%j++; %>
									  </section>
								<h3>${list.get(0).roomPrice }원</h3>
						    </div>
						    </c:if>
						    
						    
						    <c:if test="${not empty img2[0] }">
						    <div align="center">
						    	<h3>${list.get(1).roomType }</h3>
						      		<section class="fade">
									<%j = 0; %>
									  <c:forEach var="j" begin="0" end="${fn:length(img2)-1}" step="1">
									  <c:choose>
									  	<c:when test = "${status eq 'find' }">
									  	<c:if test="${not empty img2[j] }">
									  		<div>
									      	<img width="960px" height="540px"
									      	src="${resourcePath }/img/${num }/${path[2] }/${img2[j] }" />
									    	</div>
									    </c:if>
									  	</c:when>
									  
									  </c:choose>
									   </c:forEach>
									   <%j++; %>
									  </section>
								<h3>${list.get(1).roomPrice }원</h3>
						    </div>
						    </c:if>
						    
						    <c:if test="${not empty img3[0] }">
						    <div align="center">
						    	<h3>${list.get(2).roomType }</h3>
						      		<section class="fade">
									<%j = 0; %>
									  <c:forEach var="j" begin="0" end="${fn:length(img3)-1}" step="1">
									  <c:choose>
									  	<c:when test = "${status eq 'find' }">
									  	<c:if test="${not empty img3[j] }">
									  		<div>
									      	<img width="960px" height="540px"
									      	src="${resourcePath }/img/${num }/${path[3] }/${img3[j] }" />
									    	</div>
									    </c:if>
									  	</c:when>
									  
									  </c:choose>
									   </c:forEach>
									   <%j++; %>
									  </section>
								<h3>${list.get(2).roomPrice }원</h3>
						    </div>
						    </c:if>
						    
						    <c:if test="${not empty img4[0] }">
						    <div align="center">
						    	<h3>${list.get(3).roomType }</h3>
						      		<section class="fade">
									<%j = 0; %>
									  <c:forEach var="j" begin="0" end="${fn:length(img4)-1}" step="1">
									  <c:choose>
									  	<c:when test = "${status eq 'find' }">
									  	<c:if test="${not empty img4[j] }">
									  		<div>
									      	<img width="960px" height="540px"
									      	src="${resourcePath }/img/${num }/${path[4] }/${img4[j] }" />
									    	</div>
									    </c:if>
									  	</c:when>
									  
									  </c:choose>
									   </c:forEach>
									   <%j++; %>
									  </section>
								<h3>${list.get(3).roomPrice }원</h3>
						    </div>
						    </c:if>
						    
						    <c:if test="${not empty img5[0] }">
						    <div align="center">
						    	<h3>${list.get(4).roomType }</h3>
						      		<section class="fade">
									<%j = 0; %>
									  <c:forEach var="j" begin="0" end="${fn:length(img5)-1}" step="1">
									  <c:choose>
									  	<c:when test = "${status eq 'find' }">
									  	<c:if test="${not empty img5[j] }">
									  		<div>
									      	<img width="960px" height="540px"
									      	src="${resourcePath }/img/${num }/${path[5] }/${img5[j] }" />
									    	</div>
									    </c:if>
									  	</c:when>
									  
									  </c:choose>
									   </c:forEach>
									   <%j++; %>
									  </section>
								<h3>${list.get(4).roomPrice }원</h3>
						    </div>
						    </c:if>
						    <h1 align="center">이용후기</h1>	
						    <div align="left">						    						    		  
									  <c:forEach var="j" begin="0" end="${size }" step="1">
									    <div>　　　　　　　　　　　　　　　　　　　　　　　
									    	<c:forEach var="k" begin="1" end="${slist.get(j).score/2 }" step="1">
									    		<%=star1 %>
									    	</c:forEach>
									    	<c:if test="${slist.get(j).score%2!=0 }"><%=star2 %></c:if>
									       ${slist.get(j).userId } : ${slist.get(j).userMemo }
									    </div>
								   </c:forEach>				    		
						    </div>
						    								
						</main>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
</body>

<script type="text/javascript">
$('.slider-for').slick({
 slidesToShow: 1,
 slidesToScroll: 1,
 arrows: false,
 fade: true,
 asNavFor: '.center'
});
$('.center').slick({
 slidesToShow: 5,
 slidesToScroll: 1,
 asNavFor: '.slider-for',
 dots: true,
 centerMode: true,
 focusOnSelect: true
});

$('.fade').slick({
  dots: true,
  infinite: true,
  speed: 500,
  fade: true,
  cssEase: 'linear'
});
 </script>
   <script type="text/javascript">
	
  	if('${result}'==1){
  		alert("즐겨찾기 등록완료");
  	}else if('${result}'==2){
  		alert("이미 등록된 호텔입니다.");
  	}
    
    
    window.loginC = function() {
 	   var f = document.myForm;
 		if(${empty sessionScope.LoginInfo.dto }){
 			f.action="<%=cp %>/user/login.do?type=4";
 			f.submit();
 		}else{
 		f.action="<%=cp %>/reserve/hotel_reserve.do?hnum=${hdto.hnum}";
 		f.submit();
 		}
    }
 		
    window.loginC1 = function(){
 	   var f = document.myForm;
 		if(${empty sessionScope.LoginInfo.dto }){
 			f.action="<%=cp %>/user/login.do?type=4";
 		f.submit();
 	}else{
 		f.action="<%=cp %>/reserve/favorites_ok.do?hnum=${hdto.hnum}&userId=${sessionScope.LoginInfo.dto.userId }";
 	f.submit();
 			}		  
     }

  </script>
</html>