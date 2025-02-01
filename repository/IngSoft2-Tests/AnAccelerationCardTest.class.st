Class {
	#name : #AnAccelerationCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
AnAccelerationCardTest >> test_01_AcellerationCardPowerMoveIs1 [ 
| aCard |
aCard:= AccelerationCard new.
self assert: aCard powerMove equals: 1.
]

{ #category : #running }
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

{ #category : #running }
AnAccelerationCardTest >> test_03_AnAcelerationCardMessageIsBeingRefactor [ 

	| anAcelerationCard aShip anotherShip aBoardGame boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie shipsPlaying |
	anAcelerationCard := AccelerationCard new.
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 50.
	anotherLoadedDie := LoadedDie of: 40.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
		              andwithNumberOfLaps: 2.
	shipsPlaying := aBoardGame getShipsPlaying.
	aShip := shipsPlaying at: 1.
	anotherShip := shipsPlaying at: 2. 
	
	self assert: ((anAcelerationCard affectTo: aShip from: anotherShip playing: aBoardGame) isKindOf: AccelerationCard ).


]
