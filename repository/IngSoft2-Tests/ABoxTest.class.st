Class {
	#name : #ABoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
ABoxTest >> should: aBlockError raise: aClassError withMessage: aMessage [ 
		self should: aBlockError raise: aClassError withExceptionDo: [ :error | self assert: error messageText equals: aMessage ]
]

{ #category : #tests }
ABoxTest >> testWhenABoxAddsAShipThenItCanBeRemoved_07 [

	| aBox aShip |
	aShip := Ship create.
	aBox := Box create.
	aBox addShip: aShip.
	aBox removeShip: aShip.

	self assert: aBox getShips size equals: 0
]

{ #category : #tests }
ABoxTest >> testWhenABoxHasNoEffectOnThenItReturnsNoEffect_08 [

	| aBox |
	aBox := Box create.

	self assert: aBox effectsOn equals: 0
]

{ #category : #tests }
ABoxTest >> testWhenABoxIsCreatedInPlace1ThenPositionIs1_01 [ 

| aBox |
aBox := Box inPlace: 1.
self assert: (aBox getPosition) equals: 1.
]

{ #category : #tests }
ABoxTest >> testWhenABoxIsCreatedWithAShipThenBoxHasACollectionOfShips_05 [

	| aBox aShip collectionShips |
	collectionShips := OrderedCollection new.
	aShip := Ship create.
	collectionShips add: aShip.
	aBox := Box withShips: collectionShips.

	self assert: aBox getShips equals: (OrderedCollection with: aShip)
]

{ #category : #tests }
ABoxTest >> testWhenABoxIsCreatedWithoutAShipThenAShipCanBeAddedToTheBox_06 [

	| aBox |
	aBox := Box create.
	aBox addShip: Ship create.

	self assert: aBox getShips size equals: 1
]

{ #category : #tests }
ABoxTest >> testWhenABoxIsPlacedInPosition1ThenTheShipMustMoveToPosition1_02 [ 

| aBox |
aBox := Box inPlace: 1.
self assert: (aBox moveShipTo ) equals: 1.
]

{ #category : #tests }
ABoxTest >> testWhenBoxIsCreatedWithAPositionThenMoveShipToReturnsThePosition_03 [

| aBox |
aBox := Box inPlace: 5.
self assert: (aBox moveShipTo ) equals: 5.
]

{ #category : #tests }
ABoxTest >> testWhenTheBoxIsCreatedInPlaceLessThan1ThenBoxInvalid_04 [

	self
		should: [ Box inPlace: 0 ]
		raise: Error
		withMessage: 'The position of the box must be greater or equal to 1'
]
