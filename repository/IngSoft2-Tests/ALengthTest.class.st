Class {
	#name : #ALengthTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ALengthTest >> test_01_WhenAParsecHasMoreValueThanTheOtherThenThisParsecIsBigger [

| aParsec anotherParsec |
aParsec := Parsec withValue: 4.
anotherParsec := Parsec withValue: 3.
self assert: aParsec > anotherParsec.
]
