"
Object to model all of the options and parameters of the image creation request. 

See [https://platform.openai.com/docs/api-reference/images/create](https://platform.openai.com/docs/api-reference/images/create) for details.
"
Class {
	#name : 'OpenAISDKImageRequest',
	#superclass : 'Object',
	#instVars : [
		'prompt'
	],
	#classInstVars : [
		'prompt'
	],
	#category : 'OpenAI-Model',
	#package : 'OpenAI',
	#tag : 'Model'
}

{ #category : 'instance initialization' }
OpenAISDKImageRequest class >> withPrompt: aString [ 
	^ self new
		prompt: aString.
]

{ #category : 'converting' }
OpenAISDKImageRequest >> asDictionary [
	^ {
		('prompt' -> self prompt).
		('n' -> 1).
		('size' -> '1024x1024')
	 } asDictionary
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> prompt [
	^ prompt
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> prompt: aString [ 
	prompt := aString.
]
