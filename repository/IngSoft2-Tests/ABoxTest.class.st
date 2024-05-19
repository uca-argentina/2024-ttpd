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
ABoxTest >> testWhenABoxIsCreatedInPlace1ThenPositionIs1_01 [ 

| aBox |
aBox := Box inPlace: 1.
self assert: (aBox getPosition) equals: 1.
]

{ #category : #tests }
ABoxTest >> testWhenABoxIsCreatedWithAShipThenBoxHasACollectionOfShips [

	| aBox aShip collectionShips |
	collectionShips := OrderedCollection new.
	aShip := Ship create.
	collectionShips add: aShip.
	aBox := Box withShips: collectionShips.

	self assert: aBox getShips equals: (OrderedCollection with: aShip)
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
