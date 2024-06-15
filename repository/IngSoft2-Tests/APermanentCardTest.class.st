Class {
	#name : 'APermanentCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
APermanentCardTest >> test_01_Banana [ 

| aCard |
aCard:= OverloadCard new.

self assert: (aCard isKindOf: OverloadCard).
]
