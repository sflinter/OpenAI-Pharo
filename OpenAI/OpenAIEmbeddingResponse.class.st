Class {
	#name : 'OpenAIEmbeddingResponse',
	#superclass : 'Object',
	#instVars : [
		'object',
		'data',
		'model',
		'usage'
	],
	#category : 'OpenAI-Model',
	#package : 'OpenAI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
OpenAIEmbeddingResponse class >> createWithAPIResponse: aResponse [ 
	^ self new
		object: (aResponse at: 'object');
		data: ((aResponse at: 'data') collect: [ :e |
			OpenAIEmbeddingData createWithAPIResponse: e ]);
		model: (aResponse at: 'model');
		usage: (OpenAIEmbeddingUsage createwithAPIResponse: (aResponse at: 'usage')).
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> data [
	^ data
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> data: aDataCollection [ 
	data := aDataCollection .
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> model [
	^ model
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> model: aModelString [ 
	model := aModelString .
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> object [
	^ object
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> object: anObjectString [ 
	object := anObjectString.
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> usage [
	^ usage
]

{ #category : 'accessing' }
OpenAIEmbeddingResponse >> usage: anOpenAIEmbeddingUsage [ 
	usage := anOpenAIEmbeddingUsage .
]
