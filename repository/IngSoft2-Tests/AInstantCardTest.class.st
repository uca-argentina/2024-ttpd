Class {
	#name : #AInstantCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AInstantCardTest >> test_01_WhenAInstantCardIsAskedIfISPermanentThenTheAnswerIsFalse [

| aCard |
aCard := InstantCard new.
self deny: aCard isPermanent.
]
