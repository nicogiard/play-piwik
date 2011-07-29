%{
	enable = play.configuration.getProperty("piwik.enable", "false")
	if(enable == "true") {
		url = play.configuration.getProperty("piwik.url")
		idSite = play.configuration.getProperty("piwik.idSite")
		if (url == null || idSite == null) {
			throw new play.exceptions.TagInternalException("[piwik.url] and [piwik.idSite] configuration entries are mandatory for piwik tag");
		}
		else {
			if(!url.startsWith("http://") && !url.startsWith("https://")){
				throw new play.exceptions.TagInternalException("[piwik.url] must start with 'http://' or 'https://' for piwik tag");
		    }
		    else {
			    if(!url.endsWith("/")) {
					url = url + "/"
				}
}%
<!-- Piwik -->
<script src='${url}piwik.js' type="text/javascript"></script>
<script type="text/javascript">
try {
var piwikTracker = Piwik.getTracker("${url}piwik.php", ${idSite});
piwikTracker.trackPageView();
#{if !play.configuration.getProperty("piwik.disableLinkTracking")}
piwikTracker.enableLinkTracking();
#{/if}
} catch( err ) {}
</script>
<!-- End Piwik Tag -->
%{
			}
		}
	}
}%
