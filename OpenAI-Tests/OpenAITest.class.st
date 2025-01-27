"
1. Class: OpenAITest

I represent a class that is designed to test the functionality of the OpenAI integration in Pharo.

2. Responsibilities:
   - I am responsible for setting up and executing tests to ensure the OpenAI integration is functioning correctly.
   - I know how to simulate different scenarios to test the robustness and reliability of the OpenAI integration.
   - I am also responsible for reporting the results of these tests, which can be used to identify and fix any potential issues.

3. Collaborators:
   - OpenAI: I interact with the OpenAI API to simulate real-world usage and test its responses.
   - TestRunner: I interact with the TestRunner to execute my tests and report the results.

4. Example:
   - An example of using this class would be ""OpenAITest new runAllTests"", which would run all the tests defined in the OpenAITest class.


[This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo]
"
Class {
	#name : 'OpenAITest',
	#superclass : 'TestCase',
	#instVars : [
		'sdk'
	],
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
	| chatSession |
		
	chatSession := OpenAIChatSession startWithSDK: sdk.
	chatSession
		model: 'gpt-4o';
		submitSystemPrompt: 'You are a chatbot named OMM 0000.';
		submitUserPrompt: 'Who are you?'.
	self assert: (chatSession lastChat content findString: 'OMM 0000') > 0.
	chatSession submitUserPrompt: 'Show me Pharo code to add the number 5 to the end of your name. Respond with only Pharo code, no other text, no code block.'.
	self
		assert: (chatSession lastChat content findString: '5') > 0;
		assert: ((chatSession lastChat evaluate reject: #isSeparator) findString: 'OMM00005') > 0.
]

{ #category : 'tests' }
OpenAITest >> testChatSesssionGUI [
	"These tests currently fail. I think that it is related to how the OpenAIChatGUI widget is constructed"
	| chatGUI |

	sdk := OpenAISDK createWithAPIKey: self apiKey.
	chatGUI := OpenAIChatGUI openWithSDK: sdk.
	self
		assert: chatGUI title equals: 'OpenAI Chat';
		assert: chatGUI isBuilt ;
		assert: chatGUI fieldModel text equals: 'gpt-4o'.
	
]

{ #category : 'tests' }
OpenAITest >> testCreateImage [
	"Programtically generate images"
	| imageRequest image |
	
	self timeLimit: (Duration seconds: 30).
	imageRequest := OpenAISDKImageRequest withPrompt: 'An elephant drinking water on the moon'.
	imageRequest
		number: 2;
		imageSize: '512x512';
		model: 'dall-e-2';
		quality: 'standard';
		responseFormat: 'url';
		style: 'natural';
		user: 'pharo-test-user'.
	image := sdk createImage: imageRequest.
	self
		assert: ((DateAndTime fromUnixTime: image created) dayOfYear) equals: (Date today dayOfYear);
		assert: image images size equals: 2;
		assert: image images first bounds corner equals: 512@512.

]

{ #category : 'tests' }
OpenAITest >> testCreateImageWithPrompt [
	"Programtically generate images"
	| image |
	
	self timeLimit: (Duration seconds: 30).
	image := sdk createImageWithPrompt: 'An elephant drinking water on the moon' number: 2 size: '1024x1024'.
	self
		assert: ((DateAndTime fromUnixTime: image created) dayOfYear) equals: (Date today dayOfYear);
		assert: image images first bounds corner equals: 1024@1024.

]

{ #category : 'tests' }
OpenAITest >> testEmbedding [
	"Creates an embedding vector representing the input text."
	
	| embedding embeddingResponse |
	embedding := OpenAIEmbedding startWithSDK: sdk.
	embeddingResponse := embedding
		encodingFormat: 'float';
		submitInput: 'The food was delicious and the waiter...'.
	
	self
		assert: embeddingResponse object equals: 'list';
		assert: embeddingResponse model equals: embedding model;
		assert: ((embeddingResponse data first embedding at: 1) between: -1 and: 1);
		assert: (embeddingResponse data first embedding size > 100);
		assert: embeddingResponse usage promptTokenCount equals: 8;
		assert: embeddingResponse usage totalTokenCount equals: 8.

]

{ #category : 'tests' }
OpenAITest >> testImageGenerationGUI [
	"Open an image generation GUI.
	These tests currently fail. I think that it is related to how the OpenAIChatGUI widget is constructed"
	
	| imageGUI |
	imageGUI := OpenAIImageGUI openWithSDK: sdk.
	self
		assert: imageGUI textLabel equals: 'label'.
]

{ #category : 'tests' }
OpenAITest >> testListModels [
	|  modelIds |
	modelIds := sdk listModels allModelIds.
	self
		assert: (modelIds size > 20);
		assert: (modelIds includes: 'gpt-4o')
]

{ #category : 'tests' }
OpenAITest >> testRetrieveModel [
	| model |
	model := sdk retrieveModel: 'gpt-4o'.
	self
		assert: model ownedBy equals: 'system';
		assert: model id equals: 'gpt-4o';
		assert: model object equals: 'model'.
]

{ #category : 'tests' }
OpenAITest >> testUpdateClassComment [
	"Update any class comment with the generated Class Responsibility Collaborator (based on class definitions and source code)"

	self class updateCommentWithOpenAICRCWithSDK: sdk.
	self
		assert: (self class comment findString: 'This comment was automatically created with https://github.com/brackendev/OpenAI-Pharo') > 0.
]
