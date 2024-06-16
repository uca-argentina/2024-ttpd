Class {
	#name : 'CardBox',
	#superclass : 'Box',
	#instVars : [
		'myCardManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardBox class >> inPlace: aPosition withCardManager: aCardsManager [ 
	^self new initializeInPlace: aPosition withCardManager: aCardsManager.
]

{ #category : 'as yet unclassified' }
CardBox >> effectShips: aCollectionOfShips playing: aShip [
	| aCard |
	aCard := myCardManager createACard.
	aShip addCard: aCard.
]

{ #category : 'as yet unclassified' }
CardBox >> getCardManager [
	^myCardManager.
]

{ #category : 'initialization' }
CardBox >> initializeInPlace: aPosition withCardManager: aCardsManager [ 
	place := aPosition.
	myCardManager := aCardsManager.
]
