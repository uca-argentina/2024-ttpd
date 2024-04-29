Class {
	#name : #DummyTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DummyTest >> testBananaJuani [

^true
]

{ #category : #tests }
DummyTest >> testDummy [

	self assert: Dummy new isDummy
]
