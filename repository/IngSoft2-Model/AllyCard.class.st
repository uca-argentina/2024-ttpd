Class {
	#name : 'AllyCard',
	#superclass : 'CardPermanent',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
AllyCard >> aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips [

	(aCollectionOfShips at:aShip) addActiveCards: AllyCard new.
	(aCollectionOfShips at:anotherShip) addActiveCards: AllyCard new.
]
