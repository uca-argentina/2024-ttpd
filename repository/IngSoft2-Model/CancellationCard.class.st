Class {
	#name : #CancellationCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CancellationCard >> affect: aCardIndex in: aBoardGame [ 
	| aCard activeCardsInGame collectionOfShips |
	activeCardsInGame := aBoardGame getCards.
	aCard := activeCardsInGame at: aCardIndex.
	collectionOfShips := aBoardGame getShipsPlaying.
	self removeCard: aCard from: activeCardsInGame toShips: collectionOfShips
]

{ #category : #removing }
CancellationCard >> removeCard: aCard from: activeCardsInGame toShips: collectionOfShips [

	activeCardsInGame remove: aCard.
	collectionOfShips do: [ :ship | ship removeActiveCard: aCard].
]
