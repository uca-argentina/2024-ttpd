Class {
	#name : #ABoardGameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ABoardGameTest >> testABoardGameStarts [

 | aBoardGame |
aBoardGame := BoardGame new.
self assert: aBoardGame start.  


]
