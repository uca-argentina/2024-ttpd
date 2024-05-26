Class {
	#name : #ABlackHoleBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ABlackHoleBoxTest >> testWhenABlackHoleBoxIsCreatedThenItHasAPosition_01 [

| aBlackHoleBox |
aBlackHoleBox:= BlackHoleBox inPlace: 3.
self assert: aBlackHoleBox getPosition equals: 3
]
