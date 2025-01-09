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
OpenAITest >> testChatSession [
	"Programatically use a chat session"
	| sdk chatSession |
		
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	chatSession := OpenAIChatSession startWithSDK: sdk.
	chatSession
		model: 'gpt-4o';
		submitSystemPrompt: 'You are a chatbot named OMM 0000.';
		submitUserPrompt: 'Who are you?'.
	self assert: (chatSession lastChat content findString: 'OMM 0000') > 0.
	chatSession submitUserPrompt: 'Show me Pharo code to add the number 5 to the end of your name. Respond with only Pharo code, no other text, no code block.'.
	self assert: (chatSession lastChat content findString: '5') > 0.
	self assert: (chatSession lastChat evaluate findString: 'OMM 00005') > 0.
]

{ #category : 'tests' }
OpenAITest >> testListModels [
	| sdk modelIds |
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	modelIds := sdk listModels allModelIds.
	self assert: (modelIds size > 20).
	self assert: (modelIds includes: 'gpt-4o')
]

{ #category : 'tests' }
OpenAITest >> testRetrieveModel [
	| sdk model |
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	model := sdk retrieveModel: 'gpt-4o'.
	self assert: model ownedBy equals: 'system'.
	self assert: model id equals: 'gpt-4o'.
	self assert: model object equals: 'model'.
]
