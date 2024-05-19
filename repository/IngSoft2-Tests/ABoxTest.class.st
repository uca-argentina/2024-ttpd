Class {
	#name : #ABoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ABoxTest >> testWhenABoxIsCreatedInPlace1ThenPositionIs1 [ 

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
