Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : 'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips [

	aCollectionOfShips do:[:ship| ship addActiveCards:AccelerationCard new ].

]

{ #category : #'as yet unclassified' }
AccelerationCard >> powerMove [ 
^1.
]
