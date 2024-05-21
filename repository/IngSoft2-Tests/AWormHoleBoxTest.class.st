Class {
	#name : #AWormHoleBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AWormHoleBoxTest >> testWhenAWormHoleBoxInPlace1MovesShipToAnotherWormHoleBoxInPlace2ThenMoveShipToReturns2_02 [

| aWormHoleBox anotherWormHoleBox|
aWormHoleBox := WormHoleBox inPlace: 1.
anotherWormHoleBox := WormHoleBox inPlace: 2.
self assert: aWormHoleBox moveShipTo equals: 2.
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
