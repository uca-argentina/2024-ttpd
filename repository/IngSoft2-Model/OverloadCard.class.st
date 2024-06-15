Class {
	#name : 'OverloadCard',
	#superclass : 'CardPermanent',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OverloadCard >> aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips [
	
	(aCollectionOfShips at:anotherShip) addActiveCards: OverloadCard new.
]

{ #category : 'as yet unclassified' }
OverloadCard >> powerMove [
	^-2.
]
