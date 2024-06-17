Class {
	#name : #AOverloadCardTest,
	#superclass : #TestCase,
	#category : 'IngSoft2-Tests'
}

{ #category : #running }
AOverloadCardTest >> test_01_ThePoweMoveOfAOverloadCardIsMinus2 [ 
| aCard |
aCard:= OverloadCard new.
self assert:aCard powerMove equals: -2.

]

{ #category : #running }
AOverloadCardTest >> test_02_WhenAOverloadCardIsAplyToAShipThentheCardIsAddedToTheCollectionOfActiveCards [
| aCard aShip anotherShip aCollectionOfShips aCollectionOfDice aDie |
aCard:= OverloadCard new.

	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.	
	aCollectionOfDice := OrderedCollection new.
	aDie := LoadedDie of: 3.
	aCollectionOfDice add: aDie.
	aCard aplyEffectFrom: 1 to: 2 withShips: aCollectionOfShips.

	
self assert:((anotherShip getActiveCards at:1) isKindOf:OverloadCard).

]
