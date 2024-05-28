Class {
	#name : #AHyperGravityBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AHyperGravityBoxTest >> testAHyperGravityBoxHasANumerOfDie_02 [

	| aHyperGravity |
	aHyperGravity := HyperGravityBox inPlace: 3.
	aHyperGravity setNumber: 5.
	self assert: aHyperGravity getNumberOfDie equals: 5.
]

{ #category : #tests }
AHyperGravityBoxTest >> testBananan_04 [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 3.
	aHyperGravityBox effectShips: aCollectionOfShips  playing: aShip. 
	self assert: (aShip getState isKindOf: EffectBoxState).

]

{ #category : #tests }
AHyperGravityBoxTest >> testWhenAHyperGravityBoxIsCreatedThenIrHasAPlace_01 [

	| aHyperGravity |
	aHyperGravity := HyperGravityBox inPlace: 3.
	self assert: aHyperGravity getPosition equals: 3
]

{ #category : #tests }
AHyperGravityBoxTest >> testWhenAShipLandsInAHyperGravityBoxThenItsStateChangesToEffectoBoxState_03 [

	| aShip anotherShip aCollectionOfShips aHyperGravityBox |
	aShip:=Ship createWithMaxFuel: 1000.
	anotherShip :=Ship createWithMaxFuel: 1000.
	aCollectionOfShips:=OrderedCollection  new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip .	
	aHyperGravityBox := HyperGravityBox inPlace: 3.
	aHyperGravityBox setNumber: 5.
	aShip moves: 3.
	aHyperGravityBox effectShips: aCollectionOfShips  playing: aShip. 
	self assert: (aShip getState isKindOf: EffectBoxState).

]
