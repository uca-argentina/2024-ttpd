Class {
	#name : #AHyperJumpBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AHyperJumpBoxTest >> testWhenAHyperJumpBoxIsCreatedThenIrHasAPlace_01 [

	| aHyperJump |
	aHyperJump := HyperJumpBox inPlace: 3.
	self assert: aHyperJump getPosition equals: 3
]
