Class {
	#name : #HyperGravityBox,
	#superclass : #Box,
	#instVars : [
		'dieResult'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
HyperGravityBox class >> inPlace: aPosition [
	^self new initializeInPlace: aPosition.
]

{ #category : #'as yet unclassified' }
HyperGravityBox >> effectShips: aCollectionOfShips playing: aShip [
	aShip getLastDieResult = dieResult ifTrue: [ aShip endCursed ] ifFalse: [ aShip isCursed. ]
	
]

{ #category : #'as yet unclassified' }
HyperGravityBox >> getNumberOfDie [
	^dieResult.
]

{ #category : #initialization }
HyperGravityBox >> initializeInPlace: aPosition [
	place := aPosition.
	dieResult := 3.
]

{ #category : #initialization }
HyperGravityBox >> setNumber: aDieResult [ 
	dieResult := aDieResult.
]
