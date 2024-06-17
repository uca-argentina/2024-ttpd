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
AShipTest >> testWhenThrowingOneLoadedDieOfThreeFacesThenReturnsThree [

	| aShip aCollectionOfDice aDie |
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	aCollectionOfDice add: aDie.
	aShip := Ship create.
	self assert: (aShip throwDice: aCollectionOfDice) = 3
]

{ #category : #tests }
AShipTest >> test_01_WhenAShipHasFuelThenGetFuelReturnsIt [
	| aShip |
	aShip := Ship create.
	
	
	self assert: (aShip getFuel) equals: 100
]

{ #category : #tests }
AShipTest >> test_02_WhenAShipConsumesFuelThenTheFuelReduces [
	| aShip |
	aShip := Ship create.
	aShip consumeFuel: 50.
	
	self assert: (aShip getFuel) equals: 50
]

{ #category : #tests }
AShipTest >> test_03_WhenAShipCreatesWithAnAmountOfMaxFuelThenTheFuelIsMaxFuel [

	| aShip |
	aShip := Ship createWithMaxFuel: 10.

	self assert: aShip getFuel equals: 10
]

{ #category : #tests }
AShipTest >> test_04_WhenAShipRestartsTheFuelThenFuelIsMaxFuel [

	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	aShip consumeFuel: 50.
	
	self assert: aShip getFuel equals: 50.
	
	aShip restartFuel.

	self assert: aShip getFuel equals: 100
]

{ #category : #tests }
AShipTest >> test_05_WhenAShipHasAnAmountOfLapsThenGetLapsReturnsLaps [

	| aShip |
	aShip := Ship createWithMaxFuel: 100.
	
	self assert: aShip getLaps equals: 1
]

{ #category : #tests }
AShipTest >> test_06_WhenShipMovesInBoard4PacesThenFuelIsCosumedBy4 [

	| aShip aBoard boxDistributions anEffectManager boxes |
	aShip := Ship createWithMaxFuel: 100.
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aBoard move: aShip withDiceResult: 4.
	self assert: aShip getFuel equals: 96
]

{ #category : #tests }
AShipTest >> test_07_WhenShipMoves4PositionsThenPositionIsUpdatedTo5 [

	| aShip aBoard boxDistributions anEffectManager boxes |
	aShip := Ship createWithMaxFuel: 100.
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aBoard move: aShip withDiceResult: 4.
	self assert: aShip getPosition equals: 5
]

{ #category : #tests }
AShipTest >> test_08_WhenShipIsOutOfFuelThenPositionIsUpdatedTo1 [

	| aShip aBoard boxDistributions anEffectManager boxes |
	aShip := Ship createWithMaxFuel: 10.
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getPosition equals: 1
]

{ #category : #tests }
AShipTest >> test_09_WhenAShipRunsOutOfFuelThenFuelIsRestoredToMax [

	| aShip aBoard aParsecsList boxDistributions anEffectManager boxes |
	aShip := Ship createWithMaxFuel: 10.
	aParsecsList := #( 5 7 2 ).
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aBoard move: aShip withDiceResult: 15.
	self assert: aShip getFuel equals: 10
]

{ #category : #tests }
AShipTest >> test_10_WhenShipWantsToMoveMorePositionsThanTheAmountOfBoxesThenLapsIsUpdated [

	| aShip aBoard boxDistributions anEffectManager boxes |
	aShip := Ship createWithMaxFuel: 1000.
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aBoard move: aShip withDiceResult: 100.
	self assert: aShip getLaps equals: 2
]

{ #category : #tests }
AShipTest >> test_11_WhenLapsIsUpdatedAndTotalLapsToDoIs2ThenStateChangesToWinner [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	aShip checkIfWin: 2.
	self assert: (aShip getState isKindOf: Winner).
]

{ #category : #tests }
AShipTest >> test_12_WhenAShipIsCreatedThenNoVictory [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self deny: aShip victory.
]

{ #category : #tests }
AShipTest >> test_13_WhenAShipFinishesLapsThenVictory [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	aShip checkIfWin: 2.
	self assert: aShip victory.
]

{ #category : #tests }
AShipTest >> test_14_WhenAShipRunsOutOfFuelThenNoVictory [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self deny: aShip victory.
]

{ #category : #tests }
AShipTest >> test_15_WhenShipRunsOutOfFuelThenTurnsToSkipIs2 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self assert: (aShip getState) getContTurns equals: 3.
]

{ #category : #tests }
AShipTest >> test_16_WhenAShipIsPlayingStateThenTheShipCanPlay [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: aShip checkTurn.
]

{ #category : #tests }
AShipTest >> test_17_WhenAShipRunsOutOfFuelThenCheckTurnReturnsFalse [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	self deny: aShip checkTurn.
]

{ #category : #tests }
AShipTest >> test_18_WhenAShipChangesItStateToPlayThenStateIsKindOfPlaying [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 1000.
	aShip changeStateToPlay.
	self assert: (aShip getState isKindOf: Playing).
]

{ #category : #tests }
AShipTest >> test_19_WhenAShipDecidesToSkipOneTurnThenStateChangesToCantPlay [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip skipTurn.
	self assert: (aShip getState isKindOf: CantPlayANumberOfTurns).
]

{ #category : #tests }
AShipTest >> test_20_WhenShipDecidesToSkipATurnThenFuelIsRestoresToMaxValue [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip consumeFuel: 200.
	aShip skipTurn.
	self assert: aShip getFuel equals: 1000 .
]

{ #category : #tests }
AShipTest >> test_21_AShipKnowsItsLastDieResult [
	| aShip aCollectionOfDice aLoadedDie |
	aShip := Ship createWithMaxFuel: 1000.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aShip throwDice: aCollectionOfDice.
	self assert: aShip getLastDieResult equals: 5.
]

{ #category : #tests }
AShipTest >> test_22_AShipIsCursedThenStateChangesToEffectBoxState [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip isCursed.
	self assert: (aShip getState isKindOf: Jail)
]

{ #category : #tests }
AShipTest >> test_23_AShipEndsTheCursedTheStateChangesToPlaying [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip endCursed .
	self assert: (aShip getState isKindOf: Playing)
]

{ #category : #tests }
AShipTest >> test_24_WhenAShipDecreasedItsLapsThenLapsIs0 [
	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aShip decreaseLaps.
	self assert: aShip getLaps equals: 0.
]

{ #category : #tests }
AShipTest >> test_25_WhenAShipEntersAWormHoleThenItMovesToDestiny [

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
AShipTest >> test_26_WhenAShipEntersAWormHoleThenItConsumesFuelToDestiny [

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
AShipTest >> test_27_WhenAShipHasMoreLapsThanAnotherShipThenAShipIsGreaterThanAnotherShip [

	| aShip anotherShip |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip updateLaps.
	self assert: aShip > anotherShip.
]

{ #category : #tests }
AShipTest >> test_28_WhenAShipHasSameLapsButBiggerPositionThanAnotherShipThenAShipIsGreaterThanAnotherShip [

	| aShip anotherShip |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip moves: 5.
	self assert: aShip > anotherShip.
]

{ #category : #tests }
AShipTest >> test_29_WhenAShipHasMoreLapsButLessPositionThenAShipIsGreaterThanAnotherShip [

	| aShip anotherShip |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip moves: 5.
	aShip updateLaps.
	anotherShip moves: 10.
	self assert: aShip > anotherShip.
]

{ #category : #tests }
AShipTest >> test_30_WhenAshipHasActiveOverloadCardThenShipIsAffected [

	| aShip anotherShip aCard aCollectionOfShips |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:= OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.
	aCard:= OverloadCard new.
	aCard aplyEffectFrom: 1 to: 2  withShips: aCollectionOfShips .
	anotherShip moves: 5.
	anotherShip browseActiveCards.
	

	self assert: anotherShip getPosition equals: 4.
]

{ #category : #tests }
AShipTest >> test_31_WhenAShipHasActiveAccelerationCardThenAllShipsAffected [

	| aShip anotherShip aCard aCollectionOfShips |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:= OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.
	aCard:= AccelerationCard new.
	aCard aplyEffectFrom: 1 to:  2 withShips: aCollectionOfShips .
	anotherShip moves: 8.
	anotherShip browseActiveCards.


	self assert: anotherShip getPosition equals: 10.

	self assert: aShip getPosition equals: 1.

	aShip moves: 7.
	aShip browseActiveCards.
	self assert: aShip  getPosition equals:9.
]

{ #category : #tests }
AShipTest >> test_32_WhenAShipRunOutOfFuelAndHasAnAllyThenAllyShareFuel [

	| aShip anotherShip aCard aCollectionOfShips |
	aShip := Ship createWithMaxFuel: 5.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:= OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.
	aCard:= AllyCard new.
	
	aCard aplyEffectFrom: 1 to:  2 withShips: aCollectionOfShips .
	aShip consumeFuel: 15.
	self assert: anotherShip getFuel equals: 990.
	self assert: aShip getFuel equals: 0.


]

{ #category : #tests }
AShipTest >> test_33_WhenAshipRunOutOfFuelAndHisAllyToThenBothGoesToPositionOneWithMaxFuelAndWithCantPLayANumberOfTurnsState [

	| aShip anotherShip aCard aCollectionOfShips |
	aShip := Ship createWithMaxFuel: 5.
	anotherShip := Ship createWithMaxFuel: 20.
	aCollectionOfShips:= OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.
	aCard:= AllyCard new.
	
	aCard aplyEffectFrom: 1 to:  2 withShips: aCollectionOfShips .

	anotherShip consumeFuel: 15.
	aShip consumeFuel: 15.	
	self assert: aShip getPosition equals: 1.
	self assert: anotherShip getPosition equals: 1.
	self assert: anotherShip getFuel equals: 20.
	self assert: aShip getFuel equals: 5.
	


]

{ #category : #tests }
AShipTest >> test_34_WhenAShipCanAddACardToHisColectionOfCards [

	| aShip aCard aCollectionOfCards |
	aShip := Ship createWithMaxFuel: 5.
	aCard := AllyCard new.
	aCollectionOfCards := OrderedCollection new.
	aCollectionOfCards add: aCard.
	aShip addCard: aCard.

	self assert: aShip getCards equals: aCollectionOfCards
]

{ #category : #tests }
AShipTest >> test_35_WhenAShipThrowTheMaxDieResultThenShipWinReward [

	| aShip  aCollectionOfDice aLoadedDie aDieResult |
	aShip := Ship createWithMaxFuel: 5.

	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aDieResult:=	aShip throwDice: aCollectionOfDice.
	aShip checkReward: aDieResult withMax: 5.
	self assert: ((aShip getFuel = 4) or: (aShip getMaxFuel =6)).
]

{ #category : #tests }
AShipTest >> test_36_WhenAShipSelectsACardThenTheCardIsSelected [

	| aShip aCard anotherCard |
	aShip := Ship createWithMaxFuel: 5.

	aCard := OverloadCard new.
	anotherCard := AccelerationCard new.
	aShip addCard: aCard.
	aShip addCard: anotherCard.
	self assert: (aShip selectCard:  aCard) equals: aCard.
]

{ #category : #tests }
AShipTest >> test_37_WhenAShipWantsToRemoveACardFromItsHandThenTheCardIsRemoved [

	| aShip aCard anotherCard |
	aShip := Ship createWithMaxFuel: 5.

	aCard := OverloadCard new.
	anotherCard := AccelerationCard new.
	aShip addCard: aCard.
	aShip addCard: anotherCard.
	aShip removeCardFromHand: aCard.
	self assert: (aShip getCards size) equals: 1.
]
