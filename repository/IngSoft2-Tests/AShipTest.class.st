Class {
	#name : #AShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AShipTest >> testShipIsCreatedWithAPosition [

| aShip |
aShip := Ship inPosition: 0.
self assert: (aShip moves: 1) equals: 1.
]

{ #category : #tests }
AShipTest >> testWhenAShipMoves1PositionThenReturns1 [

| aShip |
aShip := Ship new.
self assert: (aShip moves: 1) equals: 1.
]
