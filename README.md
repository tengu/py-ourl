ourl
====

http client with oauth and pipelined processing

### usage

* GET

         $ ourl.py oget access_token.json 'https://api.twitter.com/1.1/users/lookup.json?screen_name=gvanrossum' | jq .

  Essentially a curl that does oauth

* POST

         $ echo '{"screen_name": "gvanrossum"}' | ourl.py opost access_token.json 'https://api.twitter.com/1.1/users/lookup.json' 

* streamed POST
 
         DOCUMENT_ME

* access token

         $ cat access_token.json

         {
            "consumer_key": "XXXX",
            "consumer_secret": "XXXX",
            "access_key": "xxxx",
            "access_secret": "XXXX"
         }


