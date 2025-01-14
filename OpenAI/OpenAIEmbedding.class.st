Class {
	#name : 'OpenAIEmbedding',
	#superclass : 'Object',
	#instVars : [
		'sdk',
		'model',
		'encodingFormat'
	],
	#category : 'OpenAI-Model',
	#package : 'OpenAI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
OpenAIEmbedding class >> startWithSDK: anOpenAISDK [ 
	^ self startWithSDK: anOpenAISDK model: nil.
]

{ #category : 'instance creation' }
OpenAIEmbedding class >> startWithSDK: anOpenAISDK model: aModelString [ 

	| c |
	c := self new sdk: anOpenAISDK.
	aModelString
		ifNil: [ c model: 'text-embedding-ada-002' ]
		ifNotNil: [ c model: aModelString ].
	^ c
]

{ #category : 'accessing' }
OpenAIEmbedding >> encodingFormat [
	^ encodingFormat .
	
]

{ #category : 'accessing' }
OpenAIEmbedding >> encodingFormat: anEncodingString [ 
	encodingFormat := anEncodingString.
]

{ #category : 'accessing' }
OpenAIEmbedding >> model [
	^ model
]

{ #category : 'accessing' }
OpenAIEmbedding >> model: aModelString [ 
	model := aModelString.
]

{ #category : 'accessing' }
OpenAIEmbedding >> sdk: anOpenAISdk [
	sdk := anOpenAISdk
]

{ #category : 'public' }
OpenAIEmbedding >> submitInput: anInputString [ 

	^ sdk
		createEmbedding: anInputString 
		model: model
		encodingFormat: encodingFormat.

]
