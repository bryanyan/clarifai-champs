# Did You Know That? with Chuck Norris

This is a very basic application built using Flask to showcase how simple it is to use the
Clarifai API. Input an image URL and receive a Chuck Norris joke and a short wikipedia
blurb regarding whatever you just uploaded!


## Installation: How to run on your own local machine

First, clone this repo and cd into the clarifai-demo directory.

```
$ git clone https://github.com/bryanyan/clarifai-champs.git
$ cd clarifai-champs/tech-projects/clarifai-demo
$ pip install -r requirements.txt
```

Now, open up app/keys.py and paste your appropriate Clarifai API keys.
```python
CLARIFAI_APP_ID = "YOUR APP_ID HERE"
CLARIFAI_APP_SECRET = "YOUR SECRET_KEY HERE"
```

You are now ready to use the application! 
```
$ python run.py
```
Navigate to 127.0.0.1:5000 in your browser or wherever your port is and play around!

## Resources 
Chuck Norris jokes from: http://www.icndb.com/
<br>
How to set up Clarifai API using Python: https://github.com/Clarifai/clarifai-python

## TODO
* Styling


