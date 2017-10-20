# Pharo reports

This repository packages a series of reports useful for Pharo maintainers.

## Installation

```smalltalk
Metacello new
	repository: 'github://guillep/pharo-reports:v0.1';
	baseline: 'PharoReports';
	load.
```

## Get closed pull requests between two dates

```smalltalk
PharoPullRequestReport new
	loginUser: 'guillep' password:'***';
	from: DateAndTime now;
	to: DateAndTime now - 7 days;
	go.
```
