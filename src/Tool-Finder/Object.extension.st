Extension { #name : #Object }

{ #category : #'*Tool-Finder' }
Object class >> approvedSelectorsForMethodFinder [

	^ #(at: basicAt: basicSize yourself size
	    ->
	    = == ~= hash literalEqual
	   )
]

{ #category : #'*Tool-Finder' }
Object >> closeTo: anObject [
	"Do not use this Method! It is a workaround for MethodFinder"

	^[self = anObject] ifErrorDo: [false]
]

{ #category : #'*Tool-Finder' }
Object >> copyTwoLevel [
	"one more level than a shallowCopy"
	"do not use this method we will deprecated soon"

	| newObject class index |
	class := self class.
	newObject := self shallowCopy.
	newObject == self ifTrue: [^ self].
	class isVariable
		ifTrue: 
			[index := self basicSize.
			[index > 0]
				whileTrue: 
					[newObject basicAt: index put: (self basicAt: index) shallowCopy.
					index := index - 1]].
	index := class instSize.
	[index > 0]
		whileTrue: 
			[newObject instVarAt: index put: (self instVarAt: index) shallowCopy.
			index := index - 1].
	^newObject
]
