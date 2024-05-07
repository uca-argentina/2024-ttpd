Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship class >> inPosition: aPosition [ 
	^self new initializeInPosition: aPosition.
]

{ #category : #'as yet unclassified' }
Ship >> getPosition [
	^position.
]

{ #category : #initialization }
Ship >> initializeInPosition: aPosition [ 
	position := aPosition.
]

{ #category : #'as yet unclassified' }
Ship >> moves: aNumber [
	position := position + aNumber.
	^(position).
]

{ #category : #'as yet unclassified' }
Ship >> throwDice: aCollectionOfDice [ 
	| positionsToMove |
	positionsToMove := 0.
	aCollectionOfDice do: [ :die |
	 positionsToMove := positionsToMove + (die throw). ].	
	^positionsToMove.
]
