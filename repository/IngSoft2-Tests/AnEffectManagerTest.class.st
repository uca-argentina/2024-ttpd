Class {
	#name : #AnEffectManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AnEffectManagerTest >> test_01_WhenAnEffectManagerHasOnly1DistributionThenItCreatesACollectionOfBoxesWith1Effect [

	| boxProbabilities anEffectManager expectedCollection |
	
	boxProbabilities := OrderedCollection new.
	boxProbabilities add: (BoxDistribution of: NoEffectBox withDistribution: 1).
	anEffectManager := EffectManager with: boxProbabilities.
	expectedCollection := OrderedCollection new.
	expectedCollection add: (NoEffectBox inPlace: 1).
	expectedCollection add: (NoEffectBox inPlace: 2).
		
	self
		assert: (anEffectManager createFor: 2)
		size equals: 2.
]
