Class {
	#name : #AWormHoleBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleBoxInPlace1ThenTheEffectsOnReturns1 [

	| aWormHoleBox |
	aWormHoleBox := WormHoleBox inPlace: 1.

	self assert: aWormHoleBox effectsOn equals: 1
]

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleBoxIsCretedInPlaceThenAShipCanBeAddedToTheWormHole_03 [

	| aWormholeBox |
	aWormholeBox := WormHoleBox inPlace: 2.
	aWormholeBox addShip: Ship create. 

	self assert: aWormholeBox getShips size equals: 1
]

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleBoxIsCretedInPlaceThenAShipCanBeRemovedFromTheWormHoleBox_04 [

	| aWormholeBox aShip |
	aShip := Ship create.
	aWormholeBox := WormHoleBox inPlace: 2.
	aWormholeBox addShip: aShip.
	aWormholeBox removeShip: aShip.  

	self assert: aWormholeBox getShips size equals: 0
]

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleIsCreatedInAPlaceThenGetPositionReturnsThePlace_01 [ 

| aWormHoleBox |
aWormHoleBox := WormHoleBox inPlace: 1.
self assert: (aWormHoleBox getPosition) equals: 1.
]

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleKnowsItsDestiny_05 [

	| aWormholeBox anotherWormholeBox |
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.

	self assert: aWormholeBox getDestiny equals: anotherWormholeBox .
	self assert: anotherWormholeBox getDestiny equals: aWormholeBox .
]
