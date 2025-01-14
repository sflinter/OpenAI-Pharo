Class {
	#name : 'OpenAIEmbeddingUsage',
	#superclass : 'Object',
	#instVars : [
		'promptTokenCount',
		'totalTokenCount'
	],
	#category : 'OpenAI-Model',
	#package : 'OpenAI',
	#tag : 'Model'
}

{ #category : 'accessing' }
OpenAIEmbeddingUsage >> promptTokenCount [
	^ promptTokenCount
]

{ #category : 'accessing' }
OpenAIEmbeddingUsage >> promptTokenCount: anInteger [ 
	promptTokenCount := anInteger.
]

{ #category : 'accessing' }
OpenAIEmbeddingUsage >> totalTokenCount [
	^ totalTokenCount
]

{ #category : 'accessing' }
OpenAIEmbeddingUsage >> totalTokenCount: anInteger [ 
	totalTokenCount := anInteger.
]
