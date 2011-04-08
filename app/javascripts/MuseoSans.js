/*
 * MyFonts Webfont Build ID 726780, 2011-03-20T21:38:32-0400
 * 
 * The fonts listed in this notice are subject to the End User License
 * Agreement(s) entered into by the website owner. All other parties are 
 * explicitly restricted from using the Licensed Webfonts(s).
 * 
 * You may obtain a valid license at the URLs below.
 * 
 * Webfont: Museo Sans 500
 * URL: http://new.myfonts.com/fonts/exljbris/museo-sans/500/
 * Foundry: exljbris
 * Copyright: Copyright (c) 2008 by Jos Buivenga. All rights reserved.
 * License: http://www.myfonts.com/viewlicense?1056
 * Licensed pageviews: unlimited/month
 * CSS font-family: MuseoSans-500
 * CSS font-weight: normal
 * 
 * Webfont: Museo Sans 500 Italic
 * URL: http://new.myfonts.com/fonts/exljbris/museo-sans/500-italic/
 * Foundry: exljbris
 * Copyright: Copyright (c) 2008 by Jos Buivenga. All rights reserved.
 * License: http://www.myfonts.com/viewlicense?1056
 * Licensed pageviews: unlimited/month
 * CSS font-family: MuseoSans-500Italic
 * CSS font-weight: normal
 * 
 * (c) 2011 Bitstream, Inc
*/



// safari 3.1: data-css
// firefox 3.6+: woff
// firefox 3.5+: data-css
// chrome 4+: data-css
// chrome 6+: woff
// IE 5+: eot
// IE 9: woff
// opera 10.1+: data-css
// mobile safari: svg/data-css
// android: data-css

var browserName, browserVersion, webfontType,  webfontTypeOverride;
 
if (typeof(customPath) == 'undefined')
	var customPath = false;


if (typeof(woffEnabled) == 'undefined')
	var woffEnabled = true;


if (/myfonts_test=on/.test(window.location.search))
	var myfonts_webfont_test = true;

else if (typeof(myfonts_webfont_test) == 'undefined')
	var myfonts_webfont_test = false;


if (customPath)
	var path = customPath;

else {
	var scripts = document.getElementsByTagName("SCRIPT");
	var script = scripts[scripts.length-1].src;

	if (!script.match("://") && script.charAt(0) != '/')
		script = "./"+script;
		
	var path = script.replace(/\\/g,'/').replace(/\/[^\/]*\/?$/, '');
}


if (myfonts_webfont_test)
	document.write('<script type="text/javascript" src="' +path+ '/MuseoSans_test.js"></script>');


if (/webfont=(woff|ttf|eot)/.test(window.location.search))
{
	webfontTypeOverride = RegExp.$1;

	if (webfontTypeOverride == 'ttf')
		webfontTypeOverride = 'data-css';
}


if (/MSIE (\d+\.\d+)/.test(navigator.userAgent))
{
	browserName = 'MSIE';
	browserVersion = new Number(RegExp.$1);
	if (browserVersion >= 9.0 && woffEnabled)
		webfontType = 'woff';
	else if (browserVersion >= 5.0)
		webfontType = 'eot';
}
else if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent))
{
	browserName = 'Firefox';
	browserVersion = new Number(RegExp.$1);
	if (browserVersion >= 3.6 && woffEnabled)
		webfontType = 'woff';
	else if (browserVersion >= 3.5)
		webfontType = 'data-css';
}
else if (/Chrome\/(\d+\.\d+)/.test(navigator.userAgent)) // must check before safari
{
	browserName = 'Chrome';
	browserVersion = new Number(RegExp.$1);

	if (browserVersion >= 6.0 && woffEnabled)
		webfontType = 'woff';

	else if (browserVersion >= 4.0)
		webfontType = 'data-css';
}
else if (/Mozilla.*(iPhone|iPad).* OS (\d+)_(\d+).* AppleWebKit.*Safari/.test(navigator.userAgent))
{
		browserName = 'MobileSafari';
		browserVersion = new Number(RegExp.$2) + (new Number(RegExp.$3) / 10)

	if(browserVersion >= 4.2)
		webfontType = 'data-css';

	else
		webfontType = 'svg';
}
else if (/Mozilla.*(iPhone|iPad|BlackBerry).*AppleWebKit.*Safari/.test(navigator.userAgent))
{
	browserName = 'MobileSafari';
	webfontType = 'svg';
}
else if (/Safari\/(\d+\.\d+)/.test(navigator.userAgent))
{
	browserName = 'Safari';
	if (/Version\/(\d+\.\d+)/.test(navigator.userAgent))
	{
		browserVersion = new Number(RegExp.$1);
		if (browserVersion >= 3.1)
			webfontType = 'data-css';
	}
}
else if (/Opera\/(\d+\.\d+)/.test(navigator.userAgent))
{
	browserName = 'Opera';
	if (/Version\/(\d+\.\d+)/.test(navigator.userAgent))
	{
		browserVersion = new Number(RegExp.$1);
		if (browserVersion >= 10.1)
			webfontType = 'data-css';
	}
}


if (webfontTypeOverride)
	webfontType = webfontTypeOverride;

switch (webfontType)
{
		case 'eot':
		document.write("<style>\n");
				document.write("@font-face {font-family:\"MuseoSans-500\";src:url(\"" + path + "/webfonts/eot/8fdff35ee70fd52ed467ccb2a48be74a.eot\");}\n");
				document.write("@font-face {font-family:\"MuseoSans-500Italic\";src:url(\"" + path + "/webfonts/eot/0bbfe6b40cea3b17f2830f7fc07cf8cc.eot\");}\n");
				document.write("</style>");
		break;
		
		case 'woff':
		document.write("<style>\n");
				document.write("@font-face {font-family:\"MuseoSans-500\";src:url(\"" + path + "/webfonts/woff/8fdff35ee70fd52ed467ccb2a48be74a.woff\") format(\"woff\");}\n");
				document.write("@font-face {font-family:\"MuseoSans-500Italic\";src:url(\"" + path + "/webfonts/woff/0bbfe6b40cea3b17f2830f7fc07cf8cc.woff\") format(\"woff\");}\n");
				document.write("</style>");
		break;
	
		case 'data-css':
		document.write("<link rel='stylesheet' type='text/css' href='" + path + "/webfonts/datacss/bc1efb92affce4f3ca10da966e381162.css'>");
		break;
	
		case 'svg':
		document.write("<style>\n");
				document.write("@font-face {font-family:\"MuseoSans-500\";src:url(\"" + path + "/webfonts/svg/8fdff35ee70fd52ed467ccb2a48be74a.svg#MuseoSans-500\") format(\"svg\");}\n");
				document.write("@font-face {font-family:\"MuseoSans-500Italic\";src:url(\"" + path + "/webfonts/svg/0bbfe6b40cea3b17f2830f7fc07cf8cc.svg#MuseoSans-500Italic\") format(\"svg\");}\n");
				document.write("</style>");
		break;
		
	default:
		break;
}