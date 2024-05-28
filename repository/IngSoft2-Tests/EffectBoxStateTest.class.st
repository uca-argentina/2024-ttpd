Class {
	#name : #EffectBoxStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
EffectBoxStateTest >> testBanana_02 [

	| aEffectBoxState aShip |
	aShip := Ship createWithMaxFuel: 1000.
	aEffectBoxState := EffectBoxState new.
	self deny: (aEffectBoxState checkTurn: aShip).
]

{ #category : #tests }
EffectBoxStateTest >> testBanana_03 [

	| aEffectBoxState  |
	aEffectBoxState := EffectBoxState withExpectedDie: 2.
	self assert: aEffectBoxState getExpectedDie equals: 2.
]

{ #category : #tests }
EffectBoxStateTest >> testWhenAShipIsInEffectBoxStateThenTheShipHasntWonYet_01 [

	| aEffectBoxState |
	aEffectBoxState := EffectBoxState new.
	self deny: aEffectBoxState checkPlay
]
