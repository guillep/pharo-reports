execute
go
	
	| iterator prs |	
	iterator := self github iteratorOn: (GHGetPullRequests new
		repositoryName: 'pharo';
		ownerName: 'pharo-project';
		state: 'closed';
		sort: 'updated';
		direction: 'desc';
		yourself).
	
	prs := iterator
		collect: [ :rq | rq parseJSON collect: [ :pr | GHPullRequest on: pr ] ];
		select: [ :pr | pr isMerged and: [ pr mergeDate between: to asZTimestamp and: from asZTimestamp ] ];
		until: [ :pr | pr updateDate < to asZTimestamp ];
		iterate.

	^ prs