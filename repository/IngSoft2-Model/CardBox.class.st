Class {
	#name : #CardBox,
	#superclass : #Box,
	#instVars : [
		'myCardManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardBox class >> inPlace: aPosition [
	^self new initializeInPlace: aPosition.
]

{ #category : #'as yet unclassified' }
CardBox >> effectShips: aCollectionOfShips playing: aShip [
	| aCard |
	aCard := myCardManager createACard.
	aShip addCard: aCard.
]

{ #category : #'as yet unclassified' }
CardBox >> getCardManager [
	^myCardManager.
]

{ #category : #initialization }
CardBox >> initializeInPlace: aPosition [
	place := aPosition.
	myCardManager := CardsManager new.
]
