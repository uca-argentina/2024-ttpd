Class {
	#name : #BlackHoleBox,
	#superclass : #Box,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BlackHoleBox >> effectShips: aCollection playing: aShip [ 
	aShip moves: -4.
	aShip consumeFuel: 4.
]

{ #category : #'as yet unclassified' }
BlackHoleBox >> effectsOn [

	^(place-4)
]