Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCard >> affectTo: aTarget from: aShip playing: aBoardGame [ 
	| aCard |
	aCard := aBoardGame getLastCard.
	aBoardGame playCard: aCard fromShip: aShip toTarget: aTarget.
	^aCard.
]
