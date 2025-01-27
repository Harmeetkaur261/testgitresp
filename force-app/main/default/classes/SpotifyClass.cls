public with sharing class SpotifyClass {
    @AuraEnabled
    public static string searchWithSpotify(String trackName){
        Http http =new Http();
        HttpRequest request=new HttpRequest();
        request.setMethod('GET');
        String endcodedName=EncodingUtil.urlEncode(trackName, 'UTF-8');

        request.setEndpoint('callout:Spotify/search?q='+endcodedName+'&type=track&limit=1');
        try {
            httpresponse response = http.send(request);
            System.debug(' httpresponse ='+ response.getBody());
            System.debug('Response Status Code : '+response.getStatusCode());
            System.debug('Response Status : '+response.getStatus());

        } catch (Exception ex) {
            System.debug(ex.getMessage());
            return ex.getMessage();
        }
    } 
}