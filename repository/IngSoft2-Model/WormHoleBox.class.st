Class {
	#name : #WormHoleBox,
	#superclass : #Box,
	#instVars : [
		'position',
		'destiny'
	],
	#category : 'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormHoleBox class >> inPlace: aPosition [ 
	^self new initializeInPlace: aPosition.
]

{ #category : #'as yet unclassified' }
WormHoleBox >> effectShips: aCollection playing: aShip [

	| positionToMove |
	positionToMove:= (destiny getPosition ) - position.
	
	aShip moves: positionToMove.
	aShip  consumeFuel: (positionToMove abs).
	 
]

{ #category : #'as yet unclassified' }
WormHoleBox >> effectsOn [

	^position
]

{ #category : #'as yet unclassified' }
WormHoleBox >> getDestiny [
	^ destiny .
]

{ #category : #'as yet unclassified' }
WormHoleBox >> getPosition [
	^position.
]

{ #category : #initialization }
WormHoleBox >> initializeInPlace: aPosition [

	super initializeBox.
	position := aPosition
]

{ #category : #'as yet unclassified' }
WormHoleBox >> withDestiny: aWormHoleBox [ 
	destiny:= aWormHoleBox.
]
