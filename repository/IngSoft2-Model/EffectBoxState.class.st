Class {
	#name : #EffectBoxState,
	#superclass : #State,
	#instVars : [
		'expectedResult'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
EffectBoxState class >> withExpectedDie: aDieResult [ 
	^self new initializeWithExpectedDie: aDieResult.
]

{ #category : #'as yet unclassified' }
EffectBoxState >> checkTurn: aShip [ 
	^false
]

{ #category : #'as yet unclassified' }
EffectBoxState >> getExpectedDie [
	^expectedResult.
]

{ #category : #initialization }
EffectBoxState >> initializeWithExpectedDie: aDieResult [ 
	expectedResult := aDieResult.
]
