Class {
	#name : #ABoardGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
ABoardGameTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : #tests }
ABoardGameTest >> testWhenAGameIsPlayedWithALoadedDieAndShip1MustWinThenShip1Wins [

	| aBoardGame aBoard aCollectionOfDice aLoadedDie boxDistributions anEffectManager boxes |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 102.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBoardGame playTurn.
	self assert: aBoardGame winnerIs equals: 1
]

{ #category : #tests }
ABoardGameTest >> test_05_WhenABoardGameIsCreatedThenItHasANumberOfLapsToDo [

	| aBoardGame aCollectionOfDice aLoadedDie  boxDistributions anEffectManager boxes aBoard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 1
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	self assert: aBoardGame getLapsToDo equals: 2
]

{ #category : #tests }
ABoardGameTest >> test_06_WhenTheGameIsPlayedWithMoreThanOneBoxThenTheGameHasAWinner [

	| aBoardGame aCollectionOfDice aLoadedDie boxDistributions anEffectManager boxes aBoard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playTurn.
	self assert: aBoardGame winnerIs equals: 1
]

{ #category : #tests }
ABoardGameTest >> test_07_WhenTheGameIsAskedToChangeTurnThenTheTurnIsIncremented [

	| turn aBoard aCollectionOfDice aLoadedDie aBoardGame nextTurn boxDistributions anEffectManager boxes |
	turn := 1.

	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 102.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	nextTurn := aBoardGame changeTurn: turn.
	self assert: nextTurn equals: 2
]

{ #category : #tests }
ABoardGameTest >> test_08_WhenAGameFinishesThenRankingIsShown [

	| aBoardGame aCollectionOfDice aLoadedDie expectedRanking ranking boxDistributions anEffectManager boxes aBoard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDieWithSequence loadedWithSequence: #( 3 100 5 ).
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	expectedRanking := OrderedCollection new.
	expectedRanking add: 2.
	expectedRanking add: 1.
	expectedRanking add: 3.
	aBoardGame playTurn.
	aBoardGame playTurn.
	ranking := aBoardGame showRanking.
	self assert: aBoardGame showRanking equals: expectedRanking
]

{ #category : #tests }
ABoardGameTest >> test_09_ABoardGameWillNotStartWithLessThan1Ship [

	| aCollectionOfDice aDie boxesArray|
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	self
		should: [
			BoardGame
				withShip: 0
				withBoard: (Board withBoxesArray: boxesArray)
				WithDice: aCollectionOfDice
				andwithNumberOfLaps: 2 ]
		raise: Error
		withMessage: 'A Board must have at least 1 ship to be created'
]

{ #category : #tests }
ABoardGameTest >> test_10_ABoardGameWillNotStartWithLessThan2Laps [

	| aCollectionOfDice aDie boxesArray|
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	self
		should: [
			BoardGame
				withShip: 1
				withBoard: (Board withBoxesArray: boxesArray)
				WithDice: aCollectionOfDice
				andwithNumberOfLaps: 1 ]
		raise: Error
		withMessage: 'A Board must have at least 2 laps to be created' 
]

{ #category : #tests }
ABoardGameTest >> test_11_WhenItIsAPlayerTurnThenPlayerChooseToPlay [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard |
		boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 100.
	aCollectionOfDice add: aLoadedDie.

	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	aBoardGame playTurn.
	self assert: aBoardGame winnerIs equals: 1
]

{ #category : #tests }
ABoardGameTest >> test_12_WhenItIsAPlayerTurnThenPlayerChooseToPassTurn [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.

	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame passTurn.
	aBoardGame playTurn.
	
	self assert: aBoardGame winnerIs equals: 2.
	
]

{ #category : #tests }
ABoardGameTest >> test_13_WhenABoardGamePlayCardThenTheCardAddedToBoardGame [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard aCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.

	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aCard := OverloadCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aCard.
	aBoardGame playTurn.
	aBoardGame playTurn.
	aBoardGame playCard: aCard.
	
	self assert: ((aBoardGame getCards at:1) isKindOf: Card ).

	
]

{ #category : #tests }
ABoardGameTest >> test_14_WhenAnRepeatCardIsPlayedByAShipThenItsRemovedFromTheShipHand [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard aCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aCard := RepeatCard new.
	((aBoardGame getShipsPlaying) at: 1)	 addCard: aCard.
	aBoardGame playInstantCard: 3 from: 1 toShip: 2.
	
	self assert: (((aBoardGame getShipsPlaying at: 1) getCards) size = 2).

	
]

{ #category : #tests }
ABoardGameTest >> test_15_WhenAnCancellationCardIsPlayedByAShipThenItsRemovedFromTheShipHand [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard aCard aPermanentCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aCard := CancellationCard new.
	aPermanentCard := OverloadCard new.
	((aBoardGame getShipsPlaying) at: 1)	 addCard: aCard.
	((aBoardGame getShipsPlaying) at: 1)	 addCard: aPermanentCard.
	aBoardGame playCard: aPermanentCard.
	aBoardGame playInstantCard: 3 from: 1 toShip: 1.
	
	self assert: (((aBoardGame getShipsPlaying at: 1) getCards) size = 2).
	self assert: aBoardGame getCards size = 0.
	
]

{ #category : #tests }
ABoardGameTest >> test_16_ABoardGameKnowsItMaxDieResult [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.

	self assert: aBoardGame getMaxDieResult equals: 90.
	
]

{ #category : #tests }
ABoardGameTest >> test_17_WhenAAccelerationCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := AccelerationCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	aBoardGame playPermanentCard: 3 toShipIndex: 2 inShipCollection: (aBoardGame getShipsPlaying).
	(aBoardGame getShipsPlaying at: 1) moves: 89.
	(aBoardGame getShipsPlaying at: 2) moves: 89.
	self assert: ((aBoardGame getShipsPlaying at: 1) getPosition) equals: 91.
	self assert: ((aBoardGame getShipsPlaying at: 2) getPosition) equals: 91.
	
]

{ #category : #tests }
ABoardGameTest >> test_18_WhenAOverloadCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := OverloadCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	aBoardGame playPermanentCard: 3 toShipIndex: 2 inShipCollection: (aBoardGame getShipsPlaying).
	(aBoardGame getShipsPlaying at: 1) moves: 89.
	(aBoardGame getShipsPlaying at: 2) moves: 89.
	self assert: ((aBoardGame getShipsPlaying at: 2) getPosition) equals: 88.
	
]

{ #category : #tests }
ABoardGameTest >> test_19_WhenAAllyCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := AllyCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	aBoardGame playPermanentCard: 3 toShipIndex: 2 inShipCollection: (aBoardGame getShipsPlaying).
	(aBoardGame getShipsPlaying at: 1) moves: 200.
	(aBoardGame getShipsPlaying at: 1) consumeFuel: 200.
	self assert: ((aBoardGame getShipsPlaying at: 1) getPosition) equals: 201.
	self assert: ((aBoardGame getShipsPlaying at: 2) getFuel) equals: 160.
	
]

{ #category : #tests }
ABoardGameTest >> test_20_TheGameKnowsTheLastCardBeingPlayed [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := AllyCard new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	aBoardGame playPermanentCard: 3 toShipIndex: 2 inShipCollection: (aBoardGame getShipsPlaying).
	self assert: ((aBoardGame getLastCard) isKindOf: AllyCard) .
	
]

{ #category : #tests }
ABoardGameTest >> test_21_WhenARedoCardIsPLayedAfterAPermanentCardThenTheEffectIsTheOneOnThePermanentCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard aRedoCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aPermanentCard := AllyCard new.
	aRedoCard := RedoCard  new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	(aBoardGame getShipsPlaying at: 1) addCard: aRedoCard.
	aBoardGame playPermanentCard: 3 toShipIndex: 2 inShipCollection: (aBoardGame getShipsPlaying).
	aBoardGame playRedoCard: 3 fromShip: 1 toShipOrCardIndex: 3.
	self assert: ((aBoardGame getShipsPlaying at: 3) getActiveCards size = 1) .
	
]

{ #category : #tests }
ABoardGameTest >> test_22_WhenARedoCardIsPLayedAfterAInstantCardThenTheEffectIsTheOneOnTheInstantCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard aRedoCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: BlackHoleBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBoardGame playTurn.	
	aBoardGame playTurn.
	aBoardGame playTurn.	
	aPermanentCard := RepeatCard new.
	aRedoCard := RedoCard  new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	(aBoardGame getShipsPlaying at: 1) addCard: aRedoCard.
	aBoardGame playInstantCard: 3 from: 1 toShip: 2.
	aBoardGame playRedoCard: 3 fromShip: 1 toShipOrCardIndex: 3.
	self assert: (((aBoardGame getShipsPlaying at: 1) getPosition) = 87) .
	self assert: (((aBoardGame getShipsPlaying at: 2) getPosition) = 83) .
	self assert: (((aBoardGame getShipsPlaying at: 3) getPosition) = 83) .
	
]

{ #category : #tests }
ABoardGameTest >> test_23_WhenARedoCardIsPLayedAfterAReDoCardThenTheEffectIsTheOneOnTheReDoCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aPermanentCard aRedoCard anotherRedoCard |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: BlackHoleBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 100.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBoardGame playTurn.	
	aBoardGame playTurn.
	aBoardGame playTurn.	
	aPermanentCard := RepeatCard new.
	aRedoCard := RedoCard  new.
	anotherRedoCard := RedoCard  new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	(aBoardGame getShipsPlaying at: 1) addCard: aRedoCard.
	(aBoardGame getShipsPlaying at: 1) addCard: anotherRedoCard.
	aBoardGame playInstantCard: 3 from: 1 toShip: 2.
	aBoardGame playRedoCard: 3 fromShip: 1 toShipOrCardIndex: 3.
	aBoardGame playRedoCard: 3 fromShip: 1 toShipOrCardIndex: 3.
	self assert: (((aBoardGame getShipsPlaying at: 1) getPosition) = 87) .
	self assert: (((aBoardGame getShipsPlaying at: 2) getPosition) = 83) .
	self assert: (((aBoardGame getShipsPlaying at: 3) getPosition) = 79) .
	
]

{ #category : #tests }
ABoardGameTest >> test_24_WhenABoardGameAddsInformationtoAHyperJumpBoxThenItIsAdded [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aBox aParsecsList|
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: HyperJumpBox  withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 3.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBox := aBoard boxes at: 3.
	aParsecsList := OrderedCollection new.
	aParsecsList add: (Parsec withValue: 7).
	aParsecsList add: (Parsec withValue: 5).
	aParsecsList add: (Parsec withValue: 2).
	aBoardGame addHyperJumpInformationTo: aBox withParsecList: aParsecsList withParsecLenght: 100.

	self assert: aBox getParsecList equals: aParsecsList . 
	
]

{ #category : #tests }
ABoardGameTest >> test_25_WhenABoardGameAddsInformationtoAHyperGravityBoxThenItIsAdded [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aBox aDieResult|
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: HyperGravityBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 3.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBox := aBoard boxes at: 3.
	aDieResult := 4.
	aBoardGame addHyperGravityInformationTo: aBox withDieResult: aDieResult.

	self assert: aBox getNumberOfDie equals: aDieResult . 
	
]

{ #category : #tests }
ABoardGameTest >> test_26_WhenABoardGameAddsInformationAMoonWalkBoxThenItIsReturned [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aBox aBoxNumber|
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: MoonWalkBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 3.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBox := aBoard boxes at: 3.
	aBoxNumber := 4.
	aBoardGame addMoonWalkInformationTo: aBox withBoxesNumber: aBoxNumber.

	self assert: aBox getnumberOfBoxesToMove equals: aBoxNumber . 
	
]

{ #category : #tests }
ABoardGameTest >> test_27_WhenANotHyperGravityBoxAskToAddInformationThenAErrorRaise [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aBox aDieResult |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: MoonWalkBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 3.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBox := aBoard boxes at: 3.
	aDieResult := 4.

	self
		should: [
			aBoardGame
				addHyperGravityInformationTo: aBox
				withDieResult: aDieResult ]
		raise: Error
		withMessage: 'This is not an HyperGravityBox.'
]

{ #category : #tests }
ABoardGameTest >> test_28_WhenANotHyperJumpBoxAskToAddInformationThenAnErrorRaise [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aBox aParsecsList |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: MoonWalkBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 3.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBox := aBoard boxes at: 3.
	aParsecsList := OrderedCollection new.
	aParsecsList add: (Parsec withValue: 7).
	aParsecsList add: (Parsec withValue: 5).
	aParsecsList add: (Parsec withValue: 2).
	self
		should: [
			aBoardGame
				addHyperJumpInformationTo: aBox
				withParsecList: aParsecsList
				withParsecLenght: 100 ]
		raise: Error
		withMessage: 'This is not an HyperJumpBox.'
]

{ #category : #tests }
ABoardGameTest >> test_29_WhenANotMoonWalkBoxAskToAddInformationThenAnErrorRaise [

	| aCollectionOfDice aLoadedDie aBoardGame boxDistributions anEffectManager boxes aBoard anotherLoadedDie aBox aBoxNumber |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: HyperGravityBox withDistribution: 100).
	anEffectManager := EffectManager with: boxDistributions.
	boxes := anEffectManager createFor: 3.
	aBoard := Board withBoxesArray: boxes.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBox := aBoard boxes at: 3.
	aBoxNumber := 4.

	self
		should: [
			aBoardGame
				addMoonWalkInformationTo: aBox
				withBoxesNumber: aBoxNumber ]
		raise: Error
		withMessage: 'This is not an MoonWalkBox.'
]
