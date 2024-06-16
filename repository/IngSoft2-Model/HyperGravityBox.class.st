Class {
	#name : 'HyperGravityBox',
	#superclass : 'Box',
	#instVars : [
		'dieResult'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperGravityBox class >> inPlace: aPosition withDieResult: aDieResult [ 
	^self new initializeInPlace: aPosition withDieResult: aDieResult.
]

{ #category : 'as yet unclassified' }
HyperGravityBox >> effectShips: aCollectionOfShips playing: aShip [
	aShip getLastDieResult = dieResult ifTrue: [ aShip endCursed ] ifFalse: [ aShip isCursed. ]
	
]

{ #category : 'as yet unclassified' }
HyperGravityBox >> getNumberOfDie [
	^dieResult.
]

{ #category : 'initialization' }
HyperGravityBox >> initializeInPlace: aPosition withDieResult: aDieResult [ 
	place := aPosition.
	dieResult := aDieResult.
]

{ #category : 'initialization' }
HyperGravityBox >> setNumber: aDieResult [ 
	dieResult := aDieResult.
]
