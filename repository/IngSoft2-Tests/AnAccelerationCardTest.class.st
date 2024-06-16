Class {
	#name : 'AnAccelerationCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AnAccelerationCardTest >> test_01_AcellerationCardPowerMoveIs1 [ 
| aCard |
aCard:= AccelerationCard new.
self assert: aCard powerMove equals: 1.
]

{ #category : 'running' }
AnAccelerationCardTest >> test_02_WhenAnAccelerationCardIsAplyThenAllShipsGetThisCardActive [

| aCard aShip anotherShip aCollectionOfShips  |
	aCard:= AccelerationCard new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.	

	aCard aplyEffectFrom: 1 to: 1 withShips: aCollectionOfShips.
		
	
self assert:((anotherShip getActiveCards at:1) isKindOf:AccelerationCard).
self assert:((aShip getActiveCards at:1) isKindOf:AccelerationCard).



]
