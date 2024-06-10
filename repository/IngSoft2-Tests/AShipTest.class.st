Class {
	#name : #AShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AShipTest >> testAShipEndsTheCursedTheStateChangesToPlaying_23 [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip endCursed .
	self assert: (aShip getState isKindOf: Playing)
]

{ #category : #tests }
AShipTest >> testAShipIsCursedThenStateChangesToEffectBoxState_22 [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip isCursed.
	self assert: (aShip getState isKindOf: Jail)
]

{ #category : #tests }
AShipTest >> testAShipKnowsItsLastDieResult_21 [
	| aShip aCollectionOfDice aLoadedDie |
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aShip throwDice: aCollectionOfDice.
	self assert: aShip getLastDieResult equals: 5.
]

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
AShipTest >> testWhenAShipChangesItStateToPlayThenStateIsKindOfPlaying_18 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	aShip changeStateToPlay.
	self assert: (aShip getState isKindOf: Playing).
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
AShipTest >> testWhenAShipDecidesToSkipOneTurnThenStateChangesToCantPlay_19 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip skipTurn.
	self assert: (aShip getState isKindOf: CantPlayANumberOfTurns).
]

{ #category : #tests }
AShipTest >> testWhenAShipDecreasedItsLapsThenLapsIs0_24 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip decreaseLaps.
	self assert: aShip getLaps equals: 0.
]

{ #category : #tests }
AShipTest >> testWhenAShipEntersAWormHoleThenItConsumesFuelToDestiny_26 [

	| aShip aWormholeBox anotherWormholeBox aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip .
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.
	aShip moves: 1.
	aShip consumeFuel: 1.
	aWormholeBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getFuel equals: 997.
]

{ #category : #tests }
AShipTest >> testWhenAShipEntersAWormHoleThenItMovesToDestiny_25 [

	| aShip aWormholeBox anotherWormholeBox aCollectionOfShips |
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip .
	aWormholeBox := WormHoleBox inPlace: 2.
	anotherWormholeBox := WormHoleBox inPlace: 4.
	aWormholeBox withDestiny: anotherWormholeBox.
	anotherWormholeBox withDestiny: aWormholeBox.
	aShip moves: 1.
	aShip consumeFuel: 1.
	aWormholeBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 4.
]

{ #category : #tests }
AShipTest >> testWhenAShipFinishesLapsThenVictory_13 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	aShip checkIfWin: 2.
	self assert: aShip victory.
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
AShipTest >> testWhenAShipIsCreatedThenNoVictory_12 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self deny: aShip victory.
]

{ #category : #tests }
AShipTest >> testWhenAShipIsPlayingStateThenTheShipCanPlay_16 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: aShip checkTurn.
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
AShipTest >> testWhenAShipRunsOutOfFuelThenCheckTurnReturnsFalse_17 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self deny: aShip checkTurn.
]

{ #category : #tests }
AShipTest >> testWhenAShipRunsOutOfFuelThenFuelIsRestoredToMax_09 [
	| aShip aBoard aParsecsList |
	aShip := Ship createWithMaxFuel: 10.
	aParsecsList := #(5 7 2).
	aBoard := Board withNumberOfBoxes: 100 withParsecArray: aParsecsList aParsecLength: 1000 andMaxDieResult: 40.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getFuel equals: 10.
]

{ #category : #tests }
AShipTest >> testWhenAShipRunsOutOfFuelThenNoVictory_14 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self deny: aShip victory.
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
AShipTest >> testWhenShipDecidesToSkipATurnThenFuelIsRestoresToMaxValue_20 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 200.
	aShip skipTurn.
	self assert: aShip getFuel equals: 1000 .
]

{ #category : #tests }
AShipTest >> testWhenShipIsOutOfFuelThenPositionIsUpdatedTo1_08 [
	| aShip aBoard aParsecsList |
	aShip := Ship createWithMaxFuel: 10.
	aParsecsList := #(5 7 2).
	aBoard := Board withNumberOfBoxes: 100 withParsecArray: aParsecsList aParsecLength: 1000 andMaxDieResult: 40.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getPosition equals: 1.
]

{ #category : #tests }
AShipTest >> testWhenShipMoves4PositionsThenPositionIsUpdatedTo5_07 [
	| aShip aBoard aParsecsList |
	aShip := Ship createWithMaxFuel: 100.
	aParsecsList := #(5 7 2).
	aBoard := Board withNumberOfBoxes: 100 withParsecArray: aParsecsList aParsecLength: 1000 andMaxDieResult: 40.
	aBoard move: aShip withDiceResult: 4.
	self assert: aShip getPosition equals: 5.
]

{ #category : #tests }
AShipTest >> testWhenShipMovesInBoard4PacesThenFuelIsCosumedBy4_06 [
	| aShip aBoard aParsecsList |
	aShip := Ship createWithMaxFuel: 100.
	aParsecsList := #(5 7 2).
	aBoard := Board withNumberOfBoxes: 100 withParsecArray: aParsecsList aParsecLength: 1000 andMaxDieResult: 40.
	aBoard move: aShip withDiceResult: 4.
	self assert: aShip getFuel equals: 96.
]

{ #category : #tests }
AShipTest >> testWhenShipRunsOutOfFuelThenTurnsToSkipIs2_15 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self assert: (aShip getState) getContTurns equals: 3.
]

{ #category : #tests }
AShipTest >> testWhenShipWantsToMoveMorePositionsThanTheAmountOfBoxesThenLapsIsUpdated_10 [
	| aShip aBoard aParsecsList |
	aShip := Ship createWithMaxFuel: 1000.
	aParsecsList := #(5 7 2).
	aBoard := Board withNumberOfBoxes: 100 withParsecArray: aParsecsList aParsecLength: 1000 andMaxDieResult: 40.
	aBoard move: aShip withDiceResult: 100.
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
