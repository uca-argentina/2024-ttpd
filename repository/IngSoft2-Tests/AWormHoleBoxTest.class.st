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
AWormHoleBoxTest >> testWhenAWormHoleIsCreatedInAPlaceThenGetPositionReturnsThePlace_01 [ 

| aWormHoleBox |
aWormHoleBox := WormHoleBox inPlace: 1.
self assert: (aWormHoleBox getPosition) equals: 1.
]
