import os
from app import app
from flask import render_template, redirect, request, url_for, jsonify
import json
import wikipedia
from clarifai.client import ClarifaiApi
from app.keys import CLARIFAI_APP_ID, CLARIFAI_APP_SECRET


def getJokes():
	try:
		jsonData = open(os.path.join(os.path.dirname(__file__),"static/jokes.json"),'r')
		jokes = json.load(jsonData)
		return jokes
	except:
		return None

def searchForJoke(jokes, keyword):
	if jokes:
		jokesArray = jokes['value']
		for joke in jokesArray:
			if keyword in joke['joke']:
				return joke['joke']
		return "No joke with keyword found!"
	else:
		return "Failed to load jokes! Sorry!"

jokes = getJokes()

@app.route('/_getImage')
def getImage():
	image = request.args.get('urlname')
	if image:
		clarifai_api = ClarifaiApi(CLARIFAI_APP_ID, CLARIFAI_APP_SECRET)
		try:
			response = clarifai_api.tag_image_urls('%s' %(str(image)))
			tags = response['results'][0]['result']['tag']['classes']
			for tag in tags:
				joke = searchForJoke(jokes, tag)
				if joke != "No joke with keyword found!":
					break
			try:
				page = wikipedia.page(tags[0])
			except wikipedia.exceptions.DisambiguationError as e:
				page = e.options[0]		
			return jsonify(result=str(tags).strip("[").strip("]"), 
						   joke="Possibly inappro Chuck Norris Joke: " + joke, 
						   wiki="Fun fact: " + page.summary + "...",
						   readMore="Read more here: " + page.url)
		except:
			return jsonify(result="Failed to locate image or API keys failed!")
	return jsonify(result="No input!")

@app.route('/')
@app.route('/index')
def index():
	return render_template('index.html')

