baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec
			baseline: 'GithubAPI' 
			with: [ spec repository: 'github://guillep/github-api:v0.1' ].
		spec package: 'PharoReports' with: [ spec requires: 'GithubAPI' ]
	]