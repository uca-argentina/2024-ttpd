Class {
	#name : #AnAllyCardTest,
	#superclass : #TestCase,
	#category : 'IngSoft2-Tests'
}

{ #category : #running }
AnAllyCardTest >> test_01_WhenAnAllyCardIsAplyThenBothShipsGetsAnActiveCard [ 

| aCard aShip anotherShip aCollectionOfShips  |
	aCard:= AllyCard new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.	

	aCard aplyEffectFrom: 1 to: 2 withShips: aCollectionOfShips.
		
	
self assert:((anotherShip getActiveCards at:1) isKindOf:AllyCard).
self assert:((aShip getActiveCards at:1) isKindOf:AllyCard).



]

{ #category : #running }
AnAllyCardTest >> test_02_WhenAnAllyCardIsAplyThenBothKnowTheirAlly [

| aCard aShip anotherShip aCollectionOfShips  |
	aCard:= AllyCard new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.	

	aCard aplyEffectFrom: 1 to: 2 withShips: aCollectionOfShips.
		
	
self assert:((anotherShip getActiveCards at:1) getAlly isKindOf: Ship ).
self assert:((aShip getActiveCards at:1) getAlly isKindOf: Ship).



]
