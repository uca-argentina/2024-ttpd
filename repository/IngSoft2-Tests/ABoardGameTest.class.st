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
