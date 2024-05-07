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
AShipTest >> testWhenMoreThanOneDieInCollectionThenThrowDiceReturnsTheSumOfResults [

	| aShip aCollectionOfDice aDie anotherDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	anotherDie := LoadedDie of: 4.
	aCollectionOfDice add: aDie.
	aCollectionOfDice add: anotherDie.
	aShip := Ship inPosition: 0.
	self assert: (aShip throwDice: aCollectionOfDice) equals: 7
]

{ #category : #tests }
AShipTest >> testWhenMoreThanOneDieIsThrownThePositionOfTheShipIsUpdated [

| aShip aCollectionOfDice aDie positionsToMove anotherDie |
aCollectionOfDice := OrderedCollection new.
aDie := LoadedDie of: 3.
anotherDie := LoadedDie of: 4.
aCollectionOfDice add: aDie.
aCollectionOfDice add: anotherDie.
aShip := Ship inPosition: 0.
positionsToMove := aShip throwDice: aCollectionOfDice.
aShip moves: positionsToMove.
self assert: ((aShip getPosition) = 7).
]

{ #category : #tests }
AShipTest >> testWhenOneDieIsThrownThePositionOfTheShipIsUpdated [

| aShip aCollectionOfDice aDie positionsToMove |
aCollectionOfDice := OrderedCollection new.
aDie := LoadedDie of: 3.
aCollectionOfDice add: aDie.
aShip := Ship inPosition: 0.
positionsToMove := aShip throwDice: aCollectionOfDice.
aShip moves: positionsToMove.
self assert: ((aShip getPosition) = 3).
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
