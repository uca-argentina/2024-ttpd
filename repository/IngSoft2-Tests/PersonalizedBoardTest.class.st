Class {
	#name : #PersonalizedBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
PersonalizedBoardTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: aMessage ]
]

{ #category : #tests }
PersonalizedBoardTest >> testAPersonalizedBoardIsCreatedWithANumberOfBoxes_01 [

| aPersonalizedBoard |
aPersonalizedBoard := PersonalizedBoard withANumberOfBoxes: 4.
self assert: aPersonalizedBoard hasBoxes equals: 4.
]

{ #category : #tests }
PersonalizedBoardTest >> testWhenAPersonalizedBoardIsCreatedWithLessThan1BoxThenBoardIsInvalid_02 [

	self
		should: [ PersonalizedBoard withANumberOfBoxes: 0 ]
		raise: Error
		withMessage: 'A Board must have at least 1 box to be created'
]
