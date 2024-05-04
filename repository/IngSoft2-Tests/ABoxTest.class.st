Class {
	#name : #ABoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ABoxTest >> testABoxIsCreatedWithAPlace [ 

| aBox |
aBox := Box inPlace: 1.
self assert: aBox place equals: 1.

]
