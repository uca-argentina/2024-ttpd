Class {
	#name : #EffectManager,
	#superclass : #Object,
	#instVars : [
		'boxesDistributions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
EffectManager class >> with: aBoxDistributionCollection [ 
	^self new initilizeWith: aBoxDistributionCollection.
]

{ #category : #'as yet unclassified' }
EffectManager >> boxForRandomValue: randomValue cumulativeDistributions: cumulativeDistributions place: aPlace [ 
	| selectedBox |
        selectedBox := cumulativeDistributions detect: [:each |
            randomValue <= (each at: 2).
        ] ifNone: [cumulativeDistributions last].
        ^((selectedBox at: 1) inPlace: aPlace)
  
]

{ #category : #'as yet unclassified' }
EffectManager >> calculateCumulativeDistributions [

	| cumulativeProbabilities currentSum |
	cumulativeProbabilities := OrderedCollection new.
	currentSum := 0.
	boxesDistributions do: [ :each |
		currentSum := currentSum + (each getDistribution).
		cumulativeProbabilities add:
			(Array with: (each getEffect) with: currentSum) ].
	^ cumulativeProbabilities
]

{ #category : #'as yet unclassified' }
EffectManager >> createFor: anAmountOfBoxes [ 
	| boxes cumulativeDistributions randomValue |
        boxes := OrderedCollection new: anAmountOfBoxes.
			boxes add: (NoEffectBox inPlace: 1).		
        cumulativeDistributions := self calculateCumulativeDistributions.
        2 to: anAmountOfBoxes do: [:i |
            randomValue := Random new next * 100.
            boxes add: (self boxForRandomValue: randomValue cumulativeDistributions: cumulativeDistributions place: i).
        ].
        ^boxes
]

{ #category : #'as yet unclassified' }
EffectManager >> initilizeWith: aBoxDistributionCollection [ 
	boxesDistributions := aBoxDistributionCollection.
]
