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
ABoardGameTest >> test_05_WhenABoardGameIsCreatedThenItHasANumberOfLapsToDo [

	| aBoardGame aCollectionOfDice aLoadedDie boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aBoardGame aCollectionOfDice boxesArray aLoadedDie aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
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

	| turn aBoard aCollectionOfDice aLoadedDie aBoardGame nextTurn boxesArray |
	turn := 1.

	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aBoardGame aCollectionOfDice aLoadedDie expectedRanking ranking boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDieWithSequence loadedWithSequence: #( 3 4 5 ).
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
	boxesArray add: (NoEffectBox inPlace: 4).
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
	boxesArray add: (NoEffectBox inPlace: 4).
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 4.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
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
ABoardGameTest >> test_14_WhenAnRepeatCardIsPlayedByAShipThenItsRemovedFromTheShipHand [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard aCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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
ABoardGameTest >> test_16_ABoardGameKnowsItMaxDieResult [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	self assert: aBoardGame getMaxDieResult equals: 92.
	
]

{ #category : #tests }
ABoardGameTest >> test_17_WhenAAccelerationCardIsPlayedThenAllShipsGetTheirMovesAffected [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	boxesArray add: (NoEffectBox inPlace: 7).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 4.
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
	(aBoardGame getShipsPlaying at: 1) moves: 23.
	(aBoardGame getShipsPlaying at: 1) consumeFuel: 23.
	self assert: ((aBoardGame getShipsPlaying at: 1) getPosition) equals: 24.
	self assert: ((aBoardGame getShipsPlaying at: 2) getFuel) equals: 21.
	
]

{ #category : #tests }
ABoardGameTest >> test_20_TheGameKnowsTheLastCardBeingPlayed [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aRedoCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard aPermanentCard aRedoCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (BlackHoleBox inPlace: 2).
	boxesArray add: (BlackHoleBox inPlace: 3).
	boxesArray add: (BlackHoleBox inPlace: 4).
	boxesArray add: (BlackHoleBox inPlace: 5).
	boxesArray add: (BlackHoleBox inPlace: 6).
	boxesArray add: (BlackHoleBox inPlace: 7).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 9.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 3.
	aBoardGame playTurn.	
	aBoardGame playTurn.
	aBoardGame playTurn.	
	aPermanentCard := RepeatCard new.
	aRedoCard := RedoCard  new.
	(aBoardGame getShipsPlaying at: 1) addCard: aPermanentCard.
	(aBoardGame getShipsPlaying at: 1) addCard: aRedoCard.
	aBoardGame playInstantCard: 3 from: 1 toShip: 2.
	aBoardGame playRedoCard: 3 fromShip: 1 toShipOrCardIndex: 3.
	self assert: (((aBoardGame getShipsPlaying at: 1) getPosition) = 6) .
	self assert: (((aBoardGame getShipsPlaying at: 2) getPosition) = 2) .
	self assert: (((aBoardGame getShipsPlaying at: 3) getPosition) = 2) .
	
]

{ #category : #tests }
ABoardGameTest >> test_23_WhenARedoCardIsPLayedAfterAReDoCardThenTheEffectIsTheOneOnTheReDoCard [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aPermanentCard aRedoCard anotherRedoCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	boxesArray add: (NoEffectBox inPlace: 5).
	boxesArray add: (NoEffectBox inPlace: 6).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 4.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 3.
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
	self assert: (((aBoardGame getShipsPlaying at: 1) getPosition) = 4) .
	self assert: (((aBoardGame getShipsPlaying at: 2) getPosition) = 4) .
	self assert: (((aBoardGame getShipsPlaying at: 3) getPosition) = 4) .
	
]

{ #category : #tests }
ABoardGameTest >> test_24_WhenABoardGameAddsInformationtoAHyperJumpBoxThenItIsAdded [

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aParsecsList|
	boxesArray := OrderedCollection new.
	boxesArray add: (HyperJumpBox  inPlace: 1).
	boxesArray add: (HyperJumpBox inPlace: 2).
	boxesArray add: (HyperJumpBox inPlace: 3).
	boxesArray add: (HyperJumpBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aDieResult|
	boxesArray := OrderedCollection new.
	boxesArray add: (HyperGravityBox inPlace: 1).
	boxesArray add: (HyperGravityBox inPlace: 2).
	boxesArray add: (HyperGravityBox inPlace: 3).
	boxesArray add: (HyperGravityBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aBoxNumber|
	boxesArray := OrderedCollection new.
	boxesArray add: (MoonWalkBox inPlace: 1).
	boxesArray add: (MoonWalkBox inPlace: 2).
	boxesArray add: (MoonWalkBox inPlace: 3).
	boxesArray add: (MoonWalkBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aDieResult |
	boxesArray := OrderedCollection new.
	boxesArray add: (MoonWalkBox   inPlace: 1).
	boxesArray add: (MoonWalkBox inPlace: 2).
	boxesArray add: (MoonWalkBox inPlace: 3).
	boxesArray add: (MoonWalkBox  inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aParsecsList |
	boxesArray := OrderedCollection new.
	boxesArray add: (MoonWalkBox  inPlace: 1).
	boxesArray add: (MoonWalkBox inPlace: 2).
	boxesArray add: (MoonWalkBox inPlace: 3).
	boxesArray add: (MoonWalkBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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

	| aCollectionOfDice aLoadedDie aBoardGame boxesArray aBoard anotherLoadedDie aBox aBoxNumber |
	boxesArray := OrderedCollection new.
	boxesArray add: (HyperGravityBox  inPlace: 1).
	boxesArray add: (HyperGravityBox inPlace: 2).
	boxesArray add: (HyperGravityBox inPlace: 3).
	boxesArray add: (HyperGravityBox  inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
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
