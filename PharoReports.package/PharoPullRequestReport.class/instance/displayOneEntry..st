nice text generation
displayOneEntry: anEntry

	| body entry splitURL newURL|
	entry := (anEntry propertyAt: 'title').
	body := (anEntry propertyAt: 'body').
	stream nextPutAll: '*  ', entry ; crlf.
	splitURL := ('-' split: entry).
	newURL := 'https://pharo.fogbugz.com/f/cases/', splitURL first, '/', ('-' join: splitURL allButFirst).
	(splitURL first isAllDigits
		and: [ ('*https://pharo.fogbugz.com/f/cases/*' match: body) not ])
		ifTrue: [ stream nextPutAll: '      ', newURL ; crlf ].
	
	body ifNotEmpty: [ stream nextPutAll: '     ', body lines first ; crlf. ].
	
	stream nextPutAll: '      ', (anEntry propertyAt: 'url'); crlf.
	stream nextPutAll: '      ', (anEntry propertyAt: 'diff_url'); crlf.