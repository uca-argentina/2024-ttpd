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

{ #category : #tests }
AShipTest >> testWhenMoreThanOneDieInCollectionThenThrowDiceReturnsTheSumOfResults [

| aShip aCollectionOfDice aDie anotherDie |
aCollectionOfDice := OrderedCollection new.
aDie := LoadedDie of: 3.
anotherDie := LoadedDie of: 4.
aCollectionOfDice add: aDie.
aCollectionOfDice add: anotherDie.
aShip := Ship inPosition: 0.
self assert: ((aShip throwDice: aCollectionOfDice) = 7).
]

{ #category : #tests }
AShipTest >> testWhenThrowingOneLoadedDieOfThreeFacesThrowDiceReturnsThree [

| aShip aCollectionOfDice aDie |
aCollectionOfDice := OrderedCollection new.
aDie := LoadedDie of: 3.
aCollectionOfDice add: aDie.
aShip := Ship inPosition: 0.
self assert: ((aShip throwDice: aCollectionOfDice) = 3).
]
