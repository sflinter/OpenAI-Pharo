"
Object to model all of the options and parameters of the image creation request. 

See [https://platform.openai.com/docs/api-reference/images/create](https://platform.openai.com/docs/api-reference/images/create) for details.
"
Class {
	#name : 'OpenAISDKImageRequest',
	#superclass : 'Object',
	#instVars : [
		'prompt',
		'imageSize',
		'model',
		'quality',
		'responseFormat',
		'style',
		'user',
		'number'
	],
	#category : 'OpenAI-Model',
	#package : 'OpenAI',
	#tag : 'Model'
}

{ #category : 'instance initialization' }
OpenAISDKImageRequest class >> withPrompt: aString [ 
	^ self new
		prompt: aString;
		number: 1;
		imageSize: '1024x1024'.
]

{ #category : 'api' }
OpenAISDKImageRequest >> asDictionary [
	^ {
		('prompt' -> self prompt).
		('n' -> self number).
		('size' -> self imageSize).
		('model' -> self model).
		('quality' -> self quality).
		('response_format' -> self responseFormat).
		('style' -> self style).
		('user' -> self user)
	 } asDictionary
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> imageSize [ 
	^ imageSize
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> imageSize: anImageSize [
	imageSize := anImageSize
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> model [
	^ model
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> model: aString [
	model := aString
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> number [
	^ number
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> number: anInteger [
	number := anInteger
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> prompt [
	^ prompt
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> prompt: aString [ 
	prompt := aString.
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> quality [
	^ quality
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> quality: aString [
	quality := aString
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> responseFormat [
	^ responseFormat
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> responseFormat: aString [
	responseFormat := aString
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> style [
	^ style
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> style: aString [
	style := aString
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> user [
	^ user
]

{ #category : 'accessing' }
OpenAISDKImageRequest >> user: aString [
	user := aString
]
