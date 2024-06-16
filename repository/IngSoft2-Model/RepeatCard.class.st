Class {
	#name : #RepeatCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RepeatCard >> applyEffect: aBox toShip: aShipIndex withShipsPlaying: aCollectionOfShips [ 
	aBox effectShips: aCollectionOfShips playing: aShipIndex.
]
