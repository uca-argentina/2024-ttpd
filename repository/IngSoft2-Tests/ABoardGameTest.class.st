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
ABoardGameTest >> testABoardGameEqualsOneWhenShipOneWins [

	| aBoardGame aBoard aCollectionOfDice aLoadedDie |
	aBoard := Board
		          withNumberOfBoxes: 7
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
	aCollectionOfDice add: aLoadedDie .
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	aBoardGame start.
	self assert: aBoardGame winnerIs equals: 1.
]

{ #category : #tests }
ABoardGameTest >> testABoardGameStartsWhenCreatedWithFourShipsAndABoard [

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
		              andWithDice: aCollectionOfDice.
	self assert: aBoardGame start 
]

{ #category : #tests }
ABoardGameTest >> testABoardGameWillNotStartWithLessThanOneBox [ 


self should: [BoardGame withShip: 2 andBoard: (Board withNumberOfBoxes: 0)] raise: Error withMessage: 'A Board must have at least 1 box to be created'.


]

{ #category : #tests }
ABoardGameTest >> testABoardGameWillNotStartWithLessThanOneShip [

self should: [BoardGame withShip: 0] raise: Error withMessage: 'A Board Game should have at least 1 ship to start'.
]

{ #category : #tests }
ABoardGameTest >> testAGameEndWhenSomeoneWin [ 

	| aBoardGame aBoard aCollectionOfDice aDie |
	aBoard := Board
		          withNumberOfBoxes: 5
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	self assert: aBoardGame start  
]

{ #category : #tests }
ABoardGameTest >> testAGameStarsWith4ShipsAndASequenceDiceThen4ShipWins [

	| aBoardGame aBoard aCollectionOfDice aLoadedDieWithSequence aSequence |
	aBoard := Board
		          withNumberOfBoxes: 4
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aSequence := #( 1 2 3 4 ).
	aLoadedDieWithSequence := LoadedDieWithSequence loadedWithSequence:
		                          aSequence.
	aCollectionOfDice := OrderedCollection new.
	aCollectionOfDice add: aLoadedDieWithSequence.
	aBoardGame := BoardGame
		              withShip: 4
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	aBoardGame start.
	self assert: aBoardGame winnerIs equals: 4
]

{ #category : #tests }
ABoardGameTest >> testAGameWillNotStartWhenCreatedWithCeroShipsAndABoard [

 | aBoard |
aBoard := Board withNumberOfBoxes: 2.
self should: [BoardGame withShip: 0 andBoard: aBoard] raise: Error withMessage: 'A Board Game should have at least 1 ship to start'.


]

{ #category : #tests }
ABoardGameTest >> testBanana20 [ 

	| aBoardGame aBoard aCollectionOfDice aLoadedDie |
	aBoard := Board
		          withNumberOfBoxes: 7
		          withWormHoleStaringIn: 3
		          andEndingIn: 6.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.
	aCollectionOfDice add: aLoadedDie .
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.

	self assert: aBoardGame start 
]

{ #category : #tests }
ABoardGameTest >> testWhenABoardGameHasOneShipThenItWins [ 

	| aBoardGame aBoard aCollectionOfDice aDie |
	aBoard := Board
		          withNumberOfBoxes: 3
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	aBoardGame := BoardGame
		              withShip: 1
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	self assert: aBoardGame start
]

{ #category : #tests }
ABoardGameTest >> testWhenABoardGameHasTwoShipThenGameBoardEnd [

	| aBoardGame aBoard aCollectionOfDice aDie |
	aBoard := Board
		          withNumberOfBoxes: 3
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	self assert: aBoardGame start 
]
