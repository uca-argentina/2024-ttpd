Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Ship class >> create [
	^self new initializeShip.
]

{ #category : #'as yet unclassified' }
Ship >> getPosition [
	^position.
]

{ #category : #initialization }
Ship >> initializeShip [
	position := 0
]

{ #category : #'as yet unclassified' }
Ship >> moves: aNumber [
	position := position + aNumber.
	^(position).
]

{ #category : #'as yet unclassified' }
Ship >> movesTo: aPosition [ 
	position := aPosition.
]

{ #category : #'as yet unclassified' }
Ship >> throwDice: aCollectionOfDice [ 
	| positionsToMove |
	positionsToMove := 0.
	aCollectionOfDice do: [ :die |
	 positionsToMove := positionsToMove + (die throw). ].	
	^positionsToMove.
]
