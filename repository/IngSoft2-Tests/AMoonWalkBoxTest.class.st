Class {
	#name : #AMoonWalkBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AMoonWalkBoxTest >> testWhenAMoonWalkBoxIsCreatedThenANumberOfBoxesToMoveCanBeAssigned_02 [

	| aMoonWalkBox aShip anotherShip |
	aMoonWalkBox := MoonWalkBox inPlace: 10.
	aMoonWalkBox numberOfBoxesToMove: 5.
	self assert: aMoonWalkBox getnumberOfBoxesToMove equals: 5.
]

{ #category : #tests }
AMoonWalkBoxTest >> testWhenAMoonWalkBoxIsCreatedThenItHasAPlace_01 [

	| aMoonWalkBox |
	aMoonWalkBox := MoonWalkBox inPlace: 3.
	self assert: aMoonWalkBox getPosition equals: 3
]
