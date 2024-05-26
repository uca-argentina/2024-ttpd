Class {
	#name : #AAtomicBombBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AAtomicBombBoxTest >> testWhenAAtomicBombBoxIsCreatedThenItHasAPosition_01 [

| aAtomicBombBox |
aAtomicBombBox := AtomicBombBox inPlace: 3.
self assert: aAtomicBombBox getPosition equals: 3
]
