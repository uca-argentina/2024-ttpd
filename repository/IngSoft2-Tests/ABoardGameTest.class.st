Class {
	#name : 'ABoardGameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ABoardGameTest >> should: anErrorBlock raise: anErrorClass withMessage: aMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: aMessage ] 
]

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
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

{ #category : 'tests' }
ABoardGameTest >> test_13_WhenABoardGamePlayCardThenTheCardAddedToBoardGame [

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
	aBoardGame playCard.
	
	self assert: ((aBoardGame getCards at:1) isKindOf: Card ).

	
]
