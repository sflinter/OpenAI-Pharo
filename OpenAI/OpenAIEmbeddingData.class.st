Class {
	#name : 'OpenAIEmbeddingData',
	#superclass : 'Object',
	#instVars : [
		'object',
		'embedding',
		'index'
	],
	#category : 'OpenAI-Model',
	#package : 'OpenAI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
OpenAIEmbeddingData class >> createWithAPIResponse: aResponse [
	^ self new
		object: (aResponse at: 'object');
		embedding: (aResponse at: 'embedding');
		index: (aResponse at: 'index').

]

{ #category : 'accessing' }
OpenAIEmbeddingData >> embedding [
	^ embedding
]

{ #category : 'accessing' }
OpenAIEmbeddingData >> embedding: anEmbeddingCollection [ 
	embedding := anEmbeddingCollection .
]

{ #category : 'accessing' }
OpenAIEmbeddingData >> index [
	^ index.
]

{ #category : 'accessing' }
OpenAIEmbeddingData >> index: anIndexInteger [ 
	index := anIndexInteger .
]

{ #category : 'accessing' }
OpenAIEmbeddingData >> object [
	^ object.
]

{ #category : 'accessing' }
OpenAIEmbeddingData >> object: anObjectString [ 
	object := anObjectString .
]
