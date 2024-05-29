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
ABoardGameTest >> testABoardGameWillNotStartWithLessThanOneBox [

	self
		should: [
		BoardGame withShip: 2 andBoard: (Board withNumberOfBoxes: 0) ]
		raise: Error
		withMessage: 'A Board must have at least 1 box to be created'
]

{ #category : #tests }
ABoardGameTest >> testABoardGameWillNotStartWithLessThanOneShip_01 [

	self
		should: [ BoardGame withShip: 0 ]
		raise: Error
		withMessage: 'A Board Game should have at least 1 ship to start'
]

{ #category : #tests }
ABoardGameTest >> testABoardGameWillNotStartWithLessThanOneShip_02 [

	| aBoard |
	aBoard := Board withNumberOfBoxes: 10.
	self
		should: [ BoardGame withShip: 0 andBoard: aBoard ]
		raise: Error
		withMessage: 'A Board Game should have at least 1 ship to start'
]

{ #category : #tests }
ABoardGameTest >> testWhenABoardGameIsCreatedThenItHasANumberOfLapsToDo_05 [

	| aBoardGame aPersonalizedBoard aCollectionOfDice aLoadedDie |
	aPersonalizedBoard := PersonalizedBoard withANumberOfBoxes: 3.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 1
		              withBoard: aPersonalizedBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	self assert: aBoardGame getLapsToDo equals: 2.
]

{ #category : #tests }
ABoardGameTest >> testWhenABoardGameIsCreatedWithAPersonalizedBoardThenTheGameStarts_04 [

	| aBoardGame aPersonalizedBoard aCollectionOfDice aLoadedDie |
	aPersonalizedBoard := Board createPersonalizedBoard.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := Die of: 60.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 1
		              withBoard: aPersonalizedBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	self assert: aBoardGame startparttwo "probado"
]

{ #category : #tests }
ABoardGameTest >> testWhenAGameFinishesThenRankingIsShown_07 [

	| aBoardGame aPersonalizedBoard aCollectionOfDice aLoadedDie expectedRanking |
	aPersonalizedBoard := Board withNumberOfBoxesNoEffect: 100.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDieWithSequence loadedWithSequence: #(3 100 5).
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aPersonalizedBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	expectedRanking := OrderedCollection new.
	expectedRanking add: 2.
	expectedRanking add: 1.
	expectedRanking add: 3.
	aBoardGame startparttwo.
	self assert: aBoardGame showRanking equals: expectedRanking.
]

{ #category : #tests }
ABoardGameTest >> testWhenAGameHasANumberOfLapsThenTheGameStarts_03 [

	| aBoardGame aBoard aCollectionOfDice aDie |
	aBoard := Board
		          withNumberOfBoxes: 3
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	aBoardGame := BoardGame
		              withShip: 4
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 1.
	self assert: aBoardGame startparttwo ."probado"
]

{ #category : #tests }
ABoardGameTest >> testWhenAGameIsPlayedWithALoadedDieAndShip1MustWinThenShip1Wins [

	| aBoardGame aBoard aCollectionOfDice aLoadedDie |
	aBoard := Board withNumberOfBoxes: 100.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 102.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	aBoardGame startparttwo.
	self assert: aBoardGame winnerIsParttwo equals: 1
]

{ #category : #tests }
ABoardGameTest >> testWhenShip1EntersAWormHoleThatEndsInTheFinalPositionThenShip1Wins [

	| aBoardGame aBoard aCollectionOfDice aLoadedDie |
	aBoard := Board
		          withNumberOfBoxes: 7
		          withWormHoleStaringIn: 3
		          andEndingIn: 7.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 6
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	self assert: aBoardGame winnerIs equals: 1
	
"borrarlos"
]

{ #category : #tests }
ABoardGameTest >> testWhenTheGameIsPlayedWithMoreThanOneBoxThenTheGameStarts_06 [

	| aBoardGame aPersonalizedBoard aCollectionOfDice aLoadedDie |
	aPersonalizedBoard := Board createPersonalizedBoard.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := Die of: 50.
	aCollectionOfDice add: aLoadedDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aPersonalizedBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	self assert: aBoardGame startparttwo.
]
