Class {
	#name : #AMoonWalkBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AMoonWalkBoxTest >> testWhenAMoonWalkBoxIsCreatedThenItHasAPlace_01 [

	| aMoonWalkBox |
	aMoonWalkBox := MoonWalkBox inPlace: 3.
	self assert: aMoonWalkBox getPosition equals: 3
]
