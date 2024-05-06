Class {
	#name : #ADieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ADieTest >> testWhenDieHasFiveFacesThenValuesIsFive [

	| aDie |
	aDie := Die of: 5.

	self assert: aDie throw equals: 5
]

{ #category : #tests }
ADieTest >> testWhenDieIsThrownThenValuesIsTheAmountOfFaces [

	| aDie |
	aDie := Die of: 3.

	self assert: aDie throw equals: 3
]

{ #category : #tests }
ADieTest >> testWhenThrowingADieThenReturnsOne [

	| aDie |
	aDie := Die new.
	self assert: aDie throw equals: 1
]
