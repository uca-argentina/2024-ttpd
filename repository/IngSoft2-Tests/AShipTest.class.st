Class {
	#name : #AShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AShipTest >> testShipIsCreatedWithAPosition [

	| aShip |
	aShip := Ship create.
	self assert: (aShip moves: 1) equals: 1
]

{ #category : #tests }
AShipTest >> testWhen2LoadedDieOf3And4FacesAreThrownThenThePositionOfTheShipIsUpdatedTo7 [

	| aShip aCollectionOfDice aDie positionsToMove anotherDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	anotherDie := LoadedDie of: 4.
	aCollectionOfDice add: aDie.
	aCollectionOfDice add: anotherDie.
	aShip := Ship create.
	positionsToMove := aShip throwDice: aCollectionOfDice.
	aShip moves: positionsToMove.
	self assert: aShip getPosition = 7
]

{ #category : #tests }
AShipTest >> testWhenAShipConsumesFuelThenTheFuelReduces_02 [
	| aShip |
	aShip := Ship create.
	aShip consumeFuel: 50.
	
	self assert: (aShip getFuel) equals: 50
]

{ #category : #tests }
AShipTest >> testWhenAShipCreatesWithAnAmountOfMaxFuelThenTheFuelIsMaxFuel_03 [

	| aShip |
	aShip := Ship createWithMaxFuel: 10.

	self assert: aShip getFuel equals: 10
]

{ #category : #tests }
AShipTest >> testWhenAShipHasAnAmountOfLapsThenGetLapsReturnsLaps_05 [

	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	
	self assert: aShip getLaps equals: 1
]

{ #category : #tests }
AShipTest >> testWhenAShipHasFuelThenGetFuelReturnsIt_01 [
	| aShip |
	aShip := Ship create.
	
	
	self assert: (aShip getFuel) equals: 100
]

{ #category : #tests }
AShipTest >> testWhenAShipRestartsTheFuelThenFuelIsMaxFuel_04 [

	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	aShip consumeFuel: 50.
	
	self assert: aShip getFuel equals: 50.
	
	aShip restartFuel.

	self assert: aShip getFuel equals: 100
]

{ #category : #tests }
AShipTest >> testWhenAShipRunsOutOfFuelThenFuelIsRestoredToMax_09 [
	| aShip aBoard |
	aShip := Ship createWithMaxFuel: 10.
	aBoard := Board withNumberOfBoxes: 30 withWormHoleStaringIn: 2 andEndingIn: 3.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getFuel equals: 10.
]

{ #category : #tests }
AShipTest >> testWhenLapsIsUpdatedAndTotalLapsToDoIs2ThenStateChangesToWinner_11 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	aShip checkIfWin: 2.
	self assert: (aShip getState isKindOf: Winner).
]

{ #category : #tests }
AShipTest >> testWhenMoreThanOneLoadedDieAreThrownThenThrowDiceReturnsTheSumOfResults [

	| aShip aCollectionOfDice aDie anotherDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	anotherDie := LoadedDie of: 4.
	aCollectionOfDice add: aDie.
	aCollectionOfDice add: anotherDie.
	aShip := Ship create.
	self assert: (aShip throwDice: aCollectionOfDice) equals: 7
]

{ #category : #tests }
AShipTest >> testWhenOneLoadedDieOf3FacesIsThrownThenThePositionOfTheShipIsUpdatedTo3 [

	| aShip aCollectionOfDice aDie positionsToMove |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	aCollectionOfDice add: aDie.
	aShip := Ship create.
	positionsToMove := aShip throwDice: aCollectionOfDice.
	aShip moves: positionsToMove.
	self assert: aShip getPosition = 3
]

{ #category : #tests }
AShipTest >> testWhenShipIsOutOfFuelThenPositionIsUpdatedTo1_08 [
	| aShip aBoard |
	aShip := Ship createWithMaxFuel: 10.
	aBoard := Board withNumberOfBoxes: 30 withWormHoleStaringIn: 2 andEndingIn: 3.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getPosition equals: 1.
]

{ #category : #tests }
AShipTest >> testWhenShipMoves4PositionsThenPositionIsUpdatedTo5_07 [
	| aShip aBoard |
	aShip := Ship createWithMaxFuel: 100.
	aBoard := Board withNumberOfBoxes: 30 withWormHoleStaringIn: 2 andEndingIn: 3.
	aBoard move: aShip withDiceResult: 4.
	self assert: aShip getPosition equals: 5.
]

{ #category : #tests }
AShipTest >> testWhenShipMovesInBoard4PacesThenFuelIsCosumedBy4_06 [
	| aShip aBoard |
	aShip := Ship createWithMaxFuel: 100.
	aBoard := Board withNumberOfBoxes: 30 withWormHoleStaringIn: 2 andEndingIn: 3.
	aBoard move: aShip withDiceResult: 4.
	self assert: aShip getFuel equals: 96.
]

{ #category : #tests }
AShipTest >> testWhenShipWantsToMoveMorePositionsThanTheAmountOfBoxesThenLapsIsUpdated_10 [
	| aShip aBoard |
	aShip := Ship createWithMaxFuel: 1000.
	aBoard := Board withNumberOfBoxes: 10 withWormHoleStaringIn: 2 andEndingIn: 3.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getLaps equals: 2.
]

{ #category : #tests }
AShipTest >> testWhenThrowingOneLoadedDieOfThreeFacesThenReturnsThree [

	| aShip aCollectionOfDice aDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	aCollectionOfDice add: aDie.
	aShip := Ship create.
	self assert: (aShip throwDice: aCollectionOfDice) = 3
]
