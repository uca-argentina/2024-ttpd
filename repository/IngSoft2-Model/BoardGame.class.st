Class {
	#name : #BoardGame,
	#superclass : #Object,
	#instVars : [
		'ship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardGame class >> withShip: aShip [ 
	^self new initializeWithShip: aShip.
]

{ #category : #initialization }
BoardGame >> initializeWithShip: aShip [ 
	ship := aShip.
]

{ #category : #accessing }
BoardGame >> start [
	^true
]
