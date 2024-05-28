Class {
	#name : #HyperGravityBox,
	#superclass : #Box,
	#instVars : [
		'dieResult'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
HyperGravityBox >> effectShips: aCollectionOfShips playing: aShip [
	aShip isCursed.
]

{ #category : #'as yet unclassified' }
HyperGravityBox >> getNumberOfDie [
	^dieResult.
]

{ #category : #initialization }
HyperGravityBox >> setNumber: aDieResult [ 
	dieResult := aDieResult.
]
