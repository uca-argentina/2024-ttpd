Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position',
		'fuel',
		'maxFuel',
		'laps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Ship class >> create [
	^self new initializeShip.
]

{ #category : #'as yet unclassified' }
Ship class >> createWithMaxFuel: maxFuel [ 
	^self new intitializeWithMaxFuel: maxFuel.
]

{ #category : #'as yet unclassified' }
Ship >> consumeFuel: amount [

	fuel := fuel - amount
]

{ #category : #'as yet unclassified' }
Ship >> getFuel [
	^fuel
]

{ #category : #'as yet unclassified' }
Ship >> getLaps [
	^laps
]

{ #category : #'as yet unclassified' }
Ship >> getPosition [
	^position.
]

{ #category : #initialization }
Ship >> initializeShip [

	position := 0.
	fuel := 100
]

{ #category : #'as yet unclassified' }
Ship >> intitializeWithMaxFuel: amountMaxFuel [ 
	position:= 0.
	fuel:= amountMaxFuel.
	maxFuel:= amountMaxFuel.
	laps:= 1.
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
Ship >> restartFuel [
	fuel:= maxFuel .
]

{ #category : #'as yet unclassified' }
Ship >> throwDice: aCollectionOfDice [ 
	| positionsToMove |
	positionsToMove := 0.
	aCollectionOfDice do: [ :die |
	 positionsToMove := positionsToMove + (die throw). ].	
	^positionsToMove.
]
