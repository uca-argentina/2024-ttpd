Class {
	#name : #AnAllyCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
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

	aCard aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips.
		
	
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

	aCard aplyEffectFrom: aShip to: anotherShip withShips: aCollectionOfShips.
		
	
self assert:((anotherShip getActiveCards at:1) getAlly = aShip).
self assert:((aShip getActiveCards at:1) getAlly = anotherShip).



]
