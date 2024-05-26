Class {
	#name : #ACantPlayStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ACantPlayStateTest >> testWhenACantPlayStateIsCreatedThenANumberOfTurnsIsSaved_01 [ 
	| aCantPlayState |
	aCantPlayState := CantPlay skip: 2.
	self assert: aCantPlayState getContTurns equals: 2.
]
