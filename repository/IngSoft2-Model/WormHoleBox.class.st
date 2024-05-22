Class {
	#name : #WormHoleBox,
	#superclass : #Box,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormHoleBox class >> inPlace: aPosition [ 
	^self new initializeInPlace: aPosition.
]

{ #category : #'as yet unclassified' }
WormHoleBox >> effectsOn [

	^position
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
WormHoleBox >> moveShipTo [

	^position
]
