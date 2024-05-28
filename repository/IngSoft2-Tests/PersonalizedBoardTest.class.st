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
PersonalizedBoardTest >> testAPersonalizedBoardCanBeCreatedWith10BoxesAlways_04 [

	|aPersonalizedBoard|
aPersonalizedBoard := PersonalizedBoard createWith10Boxes.
self assert: aPersonalizedBoard hasBoxes equals: 10.
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

{ #category : #tests }
PersonalizedBoardTest >> testWhenAPersonalizedBoardMovesShipThenShipsPositionIsUpdated_03 [

	| aShip aPersonalizedBoard |
	aShip := Ship createWithMaxFuel: 1000.
	aPersonalizedBoard := PersonalizedBoard withANumberOfBoxes: 20.
	aPersonalizedBoard move: aShip withDiceResult: 4.
	self assert: aShip getPosition equals: 5.
]
