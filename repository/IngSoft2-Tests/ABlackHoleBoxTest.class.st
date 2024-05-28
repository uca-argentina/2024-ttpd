Class {
	#name : #ABlackHoleBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ABlackHoleBoxTest >> testWhenABlackHoleBoxIsCreatedThenItHasAPosition_01 [

| aBlackHoleBox |
aBlackHoleBox:= BlackHoleBox inPlace: 3.
self assert: aBlackHoleBox getPosition equals: 3
]

{ #category : #tests }
ABlackHoleBoxTest >> testWhenABlackHoleIsInPlace5ThenTheEfectOnReturns1_02 [
"EffectOn nos tiene que devolver el numero de posicion a donde la ship se tiene que mover"
| aBlackHoleBox |
aBlackHoleBox:= BlackHoleBox inPlace: 5.
self assert: aBlackHoleBox effectsOn equals: 1.
]

{ #category : #tests }
ABlackHoleBoxTest >> testWhenAShipLandsInABlackHoleThenPositionAndFuelAreUpdated_03 [

	| aBlackHoleBox aCollectionOfShips aShip anotherShip |
	aCollectionOfShips := OrderedCollection new.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aShip moves: 6.
	aShip consumeFuel: 6.
	aBlackHoleBox := BlackHoleBox inPlace: 7.
	aBlackHoleBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getPosition equals: 3.
	self assert: aShip getFuel equals: 990.
]
