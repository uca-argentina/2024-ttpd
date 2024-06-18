Class {
	#name : #ABoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
ABoxTest >> should: aBlockError raise: aClassError withMessage: aMessage [ 
		self should: aBlockError raise: aClassError withExceptionDo: [ :error | self assert: error messageText equals: aMessage ]
]

{ #category : #tests }
ABoxTest >> testWhenABoxIsCreatedInPlace1ThenPositionIs1_01 [ 

| aBox |
aBox := Box inPlace: 1.
self assert: (aBox getPosition) equals: 1.
]

{ #category : #tests }
ABoxTest >> testWhenTheBoxIsCreatedInPlaceLessThan1ThenBoxInvalid_04 [

	self
		should: [ Box inPlace: 0 ]
		raise: Error
		withMessage: 'The position of the box must be greater or equal to 1'
]

{ #category : #tests }
ABoxTest >> test_03_ABoxIsNotAnHyperGravityBoxThenItReturnsFalse [

| aBox |
aBox := Box inPlace: 1.
self deny: aBox isHyperGravityBox.
]

{ #category : #tests }
ABoxTest >> test_04_ABoxIsNotAnHyperJumpBoxThenItReturnsFalse [

| aBox |
aBox := Box inPlace: 1.
self deny: aBox isHyperJumpBox.
]
