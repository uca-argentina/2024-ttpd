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
EffectBoxStateTest >> testWhenAShipIsInEffectBoxStateThenTheShipHasntWonYet_01 [

	| aEffectBoxState |
	aEffectBoxState := EffectBoxState new.
	self deny: aEffectBoxState checkPlay
]
