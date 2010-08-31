%{
	url = play.configuration.getProperty("piwik.url")
	idSite = play.configuration.getProperty("piwik.idSite")
	if (url == null || idSite == null)
	{
		}%
		<!-- play-piwik inactive. please configure it in your application.conf (both piwik.url & piwik.idSite) -->
		%{
	}
	else{
		if(!url.startsWith("http://") && !url.startsWith("https://")){
	    	}%
	    	<!-- play-piwik inactive. please configure it correctly in your application.conf (piwik.url must start with http:// or https://) -->
	    	%{
	    }
	    else {
		    if(!url.endsWith("/")) {
				url = url + "/"/
			}
		}%
<!-- Piwik -->
<script src='${url}piwik.js' type="text/javascript"></script>
<script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker("${url}piwik.php", ${idSite});
piwikTracker.trackPageView();
piwikTracker.enableLinkTracking();
} catch( err ) {}
</script>
<!-- End Piwik Tag -->
		%{
		}
	}
}%
