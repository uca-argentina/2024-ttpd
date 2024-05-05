Class {
	#name : #ABoardGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
ABoardGameTest >> testABordGameStartsWithOneShip [

 | aBoardGame |
aBoardGame := BoardGame new.
aBoardGame initializeWithShip:   1.
self assert: aBoardGame start.


]
