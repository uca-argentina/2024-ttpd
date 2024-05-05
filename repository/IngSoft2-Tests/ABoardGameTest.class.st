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
ABoardGameTest >> testABoardGameStartsWithTwoShips [

 | aBoardGame |
aBoardGame := BoardGame new.
aBoardGame initializeWithShip:   2.
self assert: aBoardGame start.


]

{ #category : #tests }
ABoardGameTest >> testABoardGameWillNotStartWithLessThanOneShip [

 | aBoardGame |
aBoardGame := BoardGame new.
self should: [aBoardGame initializeWithShip: 0] raise: Error withMessage: 'A Board Game should have at least 1 ship to start'.
]

{ #category : #tests }
ABoardGameTest >> testABordGameStartsWithOneShip [

 | aBoardGame |
aBoardGame := BoardGame new.
aBoardGame initializeWithShip:   1.
self assert: aBoardGame start.


]
