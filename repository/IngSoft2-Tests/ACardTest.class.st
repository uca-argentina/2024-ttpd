Class {
	#name : 'ACardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
ACardTest >> test_01_aCardIsCreated [


| aCard |
aCard:= Card new.
self assert: (aCard isKindOf: Card ).
]

{ #category : 'running' }
ACardTest >> test_02_aPermanentCardIsCreated [


| aCard |
aCard:= PermanentCard new.
self assert: (aCard isKindOf: PermanentCard ).
]

{ #category : 'running' }
ACardTest >> test_03_aInstantCardIsCreated [


| aCard |
aCard:= InstantCard new.
self assert: (aCard isKindOf: InstantCard ).
]
