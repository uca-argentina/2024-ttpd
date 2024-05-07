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
ABoardGameTest >> testABoardGameIsCreatedWithAShip [

 | aBoardGame aShip |
aShip := Ship inPosition: 0.
aBoardGame := BoardGame withShip: aShip.
self assert: aBoardGame start.  


]

{ #category : #tests }
ABoardGameTest >> testABoardGameStarts [

 | aBoardGame |
aBoardGame := BoardGame new.
self assert: aBoardGame start.  


]

{ #category : #tests }
ABoardGameTest >> testABoardGameStartsWhenCreatedWith4ShipsABoardAndACollectionOfDice [

 | aBoardGame aCollectionOfDice aDie anotherDie |
aCollectionOfDice := OrderedCollection new.
aDie := Die of: 4.
anotherDie := Die of: 3.
aCollectionOfDice addAll: #(aDie anotherDie ).
aBoardGame := BoardGame withShip: 4 withBoard: 3 andWithDice: aCollectionOfDice.
self assert: aBoardGame start.


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
	self assert: aBoardGame start equals: 1.
]

{ #category : #tests }
ABoardGameTest >> testABoardGameStartsWhenCreatedWithOneShipAndABoard [

 | aBoardGame aBoard |
aBoard := Board withNumberOfBoxes: 1.
aBoardGame := BoardGame withShip: 1 andBoard: aBoard.
self assert: aBoardGame start.


]

{ #category : #tests }
ABoardGameTest >> testABoardGameStartsWithTwoShips [

 | aBoardGame |
aBoardGame := BoardGame withShip:   2.
self assert: aBoardGame start.


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
ABoardGameTest >> testABordGameStartsWithOneShip [

 | aBoardGame |
aBoardGame := BoardGame withShip: 1.
self assert: aBoardGame start.


]

{ #category : #tests }
ABoardGameTest >> testAGameWillNotStartWhenCreatedWithCeroShipsAndABoard [

 | aBoard |
aBoard := Board withNumberOfBoxes: 2.
self should: [BoardGame withShip: 0 andBoard: aBoard] raise: Error withMessage: 'A Board Game should have at least 1 ship to start'.


]

{ #category : #tests }
ABoardGameTest >> testWhenABoardGameHasOneShipThenItWins [

	| aBoardGame aBoard aCollectionOfDice aDie |
	aBoard := Board
		          withNumberOfBoxes: 1
		          withWormHoleStaringIn: 1
		          andEndingIn: 2.
	aCollectionOfDice := OrderedCollection new.
	aDie := Die of: 3.
	aCollectionOfDice add: aDie.
	aBoardGame := BoardGame
		              withShip: 1
		              withBoard: aBoard
		              andWithDice: aCollectionOfDice.
	self assert: aBoardGame start equals: 1
]
