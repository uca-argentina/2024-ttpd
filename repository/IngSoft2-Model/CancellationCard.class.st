Class {
	#name : #CancellationCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #removing }
CancellationCard >> removeCard: aCard from: aCollectionOfActiveCards [ 
	aCollectionOfActiveCards remove: aCard
]

{ #category : #removing }
CancellationCard >> removeCard: aCard from: activeCardsInGame toShips: collectionOfShips [

	activeCardsInGame remove: aCard.
	collectionOfShips do: [ :ship | ship removeCard: aCard].
]
