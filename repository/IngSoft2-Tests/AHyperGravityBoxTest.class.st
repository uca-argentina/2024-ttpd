Class {
	#name : #AHyperGravityBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AHyperGravityBoxTest >> testWhenAHyperGravityBoxIsCreatedThenIrHasAPlace_01 [

	| aHyperGravity |
	aHyperGravity := HyperGravityBox inPlace: 3.
	self assert: aHyperGravity getPosition equals: 3
]
