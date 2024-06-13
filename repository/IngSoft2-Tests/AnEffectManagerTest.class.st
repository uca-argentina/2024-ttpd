Class {
	#name : #AnEffectManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AnEffectManagerTest >> test_01_WhenAnEffectManagerHasOnly1DistributionThenItCreatesACollectionOfBoxesWithNoEffect [

	| boxDistributions anEffectManager |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: NoEffectBox withDistribution: 1).
	anEffectManager := EffectManager with: boxDistributions.


	self assert:
		(((anEffectManager createFor: 2) at: 1) isKindOf: NoEffectBox).
	self assert:
		(((anEffectManager createFor: 2) at: 2) isKindOf: NoEffectBox)
]

{ #category : #tests }
AnEffectManagerTest >> test_02_WhenAnEffectManagerHasOnly1DistributionThenItCreatesACollectionOfBoxesWithAtomicBobEffect [

	| boxDistributions anEffectManager |
	boxDistributions := OrderedCollection new.
	boxDistributions add:
		(BoxDistribution of: AtomicBombBox withDistribution: 1).
	anEffectManager := EffectManager with: boxDistributions.

	self assert:
		(((anEffectManager createFor: 2) at: 1) isKindOf: AtomicBombBox).
	self assert:
		(((anEffectManager createFor: 2) at: 2) isKindOf: AtomicBombBox)
]
