Class {
	#name : 'ACardBoxTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ACardBoxTest >> test_01_WhenACardBoxIsCreatedThenItHasACardManager [

	| aCardManager aCardBox |
	aCardManager := CardsManager new.
	aCardBox := CardBox inPlace: 4 withCardManager: aCardManager.
	self assert: ((aCardBox getCardManager) isKindOf: CardsManager). 
	
	
]

{ #category : 'tests' }
ACardBoxTest >> test_02_WhenAShipLandsInACardBoxThenACardIsAddedToItsCollectionOfCards [

	| aCardManager aCardBox aShip anotherShip aCollectionOfShips |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aCardManager := CardsManager new.
	aCardBox := CardBox inPlace: 5 withCardManager: aCardManager.
	aShip moves: 4.
	aShip consumeFuel: 4.
	aCardBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getCards size equals: 1. 
	
	
]