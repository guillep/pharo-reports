nice text generation
displayOneEntry: anEntry
	| body entry splitURL newURL html |
	entry := anEntry propertyAt: 'title'.
	body := anEntry propertyAt: 'body'.
	stream
		nextPutAll: '*  ' , entry;
		crlf.
	body lines
		do: [ :each | 
			stream
				nextPutAll: '     >> ' , each;
				crlf ].
	stream crlf.
	splitURL := '-' split: entry.
	newURL := 'https://pharo.fogbugz.com/f/cases/' , splitURL first.
	stream
		nextPutAll: '      Issue URL: ' , newURL;
		crlf.
	html := ((anEntry propertyAt: '_links') at: 'html') at: 'href'.
	stream
		nextPutAll: '      PR URL: ' , html;
		crlf.
	stream
		nextPutAll: '      Diff URL: ' , html , '/files';
		crlf;
		crlf.
	stream
		nextPutAll: '      Thanks to ' , ((anEntry propertyAt: 'user') at: 'login');
		crlf