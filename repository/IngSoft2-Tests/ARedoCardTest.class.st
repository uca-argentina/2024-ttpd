Class {
	#name : 'ARedoCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
ARedoCardTest >> test_01_WhenARedoCardIsActiveThenTheInfoIsSaveInTheCard [

	| aCard aShip anotherShip aCollectionOfShips |
	aCard := RedoCard new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection new.
	aCollectionOfShips add:aShip.
	aCollectionOfShips add:anotherShip.	

	aCard playBy: 1 to: 2 withShips: aCollectionOfShips.
	self assert: (aCard isKindOf: RedoCard) .
]
