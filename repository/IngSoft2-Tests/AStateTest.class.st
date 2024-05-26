Class {
	#name : #AStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AStateTest >> testWhenAShipIsCreatedThenItHasAState_01 [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: (aShip getState isKindOf: State)
]

{ #category : #tests }
AStateTest >> testWhenAShipIsCreatedThenTheStateHasToBePlaying_02 [

	| aShip |
	aShip := Ship createWithMaxFuel: 1000.
	self assert: (aShip getState isKindOf: Playing)
]
