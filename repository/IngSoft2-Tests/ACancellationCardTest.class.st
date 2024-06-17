Class {
	#name : #ACancellationCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ACancellationCardTest >> test_01_WhenACancellationCardIsApliedThenACardIsRemovedFromACollectionOfActiveCardsInGameAndShips [

	| aCancellationCard aCard aCollectionOfActiveCards anotherCard aCollectionOfShips aShip anotherShip |
	aCard := AccelerationCard new.
	anotherCard := OverloadCard  new.
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aShip addActiveCards: aCard.
	aShip addActiveCards: anotherCard.
	anotherShip addActiveCards: aCard.
	anotherShip addActiveCards: anotherCard.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aCollectionOfActiveCards := OrderedCollection new.
	aCollectionOfActiveCards add: aCard.
	aCollectionOfActiveCards add: anotherCard.
	aCancellationCard := CancellationCard new.
	aCancellationCard removeCard: aCard from: aCollectionOfActiveCards toShips: aCollectionOfShips.
	self assert: aCollectionOfActiveCards size equals: 1.
	self assert: aShip getActiveCards size equals: 1.
	self assert: anotherShip getActiveCards size equals: 1.
]
