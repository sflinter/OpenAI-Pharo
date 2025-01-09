Class {
	#name : 'OpenAITest',
	#superclass : 'TestCase',
	#category : 'OpenAI-Tests',
	#package : 'OpenAI-Tests'
}

{ #category : 'tests - (r) slots' }
OpenAITest >> apiKey [
	^ 'YOUR-API-KEY'
]

{ #category : 'tests' }
OpenAITest >> testListModels [
	| sdk modelIds |
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	modelIds := sdk listModels allModelIds.
	self assert: (modelIds size > 20).
	self assert: (modelIds includes: 'gpt-4o')
]
