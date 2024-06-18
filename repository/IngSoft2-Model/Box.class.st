Class {
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'place',
		'ships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Box class >> inPlace: aPlace [ 
	aPlace < 1 ifTrue: [ Error signal: 'The position of the box must be greater or equal to 1' ].
	^self new initializeInPlace: aPlace.
]

{ #category : #'as yet unclassified' }
Box >> effectShips: aCollectionOfShips playing: aShip [ 
	
]

{ #category : #'as yet unclassified' }
Box >> getPosition [
	^place.
]

{ #category : #initialization }
Box >> initializeInPlace: aPlace [
	place := aPlace.
	
]

{ #category : #testing }
Box >> isHyperGravityBox [
	^false.
]

{ #category : #testing }
Box >> isHyperJumpBox [
	^false.
]
