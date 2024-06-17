Class {
	#name : #RepeatCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RepeatCard >> affect: aShipIndex in: aBoardGame [

	| collectionOfShips board aBox |
	collectionOfShips := aBoardGame getShipsPlaying.
	board := aBoardGame getBoard.
	aBox := board getLastBox.
	self applyEffect: aBox toShip: aShipIndex withShipsPlaying: collectionOfShips 

	
]

{ #category : #'as yet unclassified' }
RepeatCard >> applyEffect: aBox toShip: aShipIndex withShipsPlaying: aCollectionOfShips [ 
	aBox effectShips: aCollectionOfShips playing: aShipIndex.
]
