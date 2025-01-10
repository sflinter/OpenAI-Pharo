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
	self
		assert: (chatSession lastChat content findString: '5') > 0;
		assert: (chatSession lastChat evaluate findString: 'OMM 00005') > 0.
]

{ #category : 'tests' }
OpenAITest >> testCreateImage [
	"Programtically generate images"
	| sdk imageRequest image |
	
	self timeLimit: (Duration seconds: 30).
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	imageRequest := OpenAISDKImageRequest withPrompt: 'An elephant drinking water on the moon'.
	image := sdk createImage: imageRequest.
	self
		assert: ((DateAndTime fromUnixTime: image created) dayOfYear) equals: (Date today dayOfYear);
		assert: image images first bounds corner equals: 1024@1024.

]

{ #category : 'tests' }
OpenAITest >> testCreateImageWithPrompt [
	"Programtically generate images"
	| sdk image |
	
	self timeLimit: (Duration seconds: 30).
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	image := sdk createImageWithPrompt: 'An elephant drinking water on the moon' number: 2 size: '1024x1024'.
	self
		assert: ((DateAndTime fromUnixTime: image created) dayOfYear) equals: (Date today dayOfYear);
		assert: image images first bounds corner equals: 1024@1024.

]

{ #category : 'tests' }
OpenAITest >> testListModels [
	| sdk modelIds |
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	modelIds := sdk listModels allModelIds.
	self
		assert: (modelIds size > 20);
		assert: (modelIds includes: 'gpt-4o')
]

{ #category : 'tests' }
OpenAITest >> testRetrieveModel [
	| sdk model |
	sdk := OpenAISDK createWithAPIKey: self apiKey.
	model := sdk retrieveModel: 'gpt-4o'.
	self
		assert: model ownedBy equals: 'system';
		assert: model id equals: 'gpt-4o';
		assert: model object equals: 'model'.
]
