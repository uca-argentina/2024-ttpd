Class {
	#name : #ACancellationCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ACancellationCardTest >> test_01_WhenACancellationCardIsApliedThenACardIsRemovedFromACollectionOfActiveCards [

	| aCancellationCard aCard aCollectionOfActiveCards anotherCard |
	aCard := AccelerationCard new.
	anotherCard := OverloadCard  new.
	aCollectionOfActiveCards := OrderedCollection new.
	aCollectionOfActiveCards add: aCard.
	aCollectionOfActiveCards add: anotherCard.
	aCancellationCard := CancellationCard new.
	aCancellationCard removeCard: aCard from: aCollectionOfActiveCards.
	self assert: aCollectionOfActiveCards size equals: 1.
]
