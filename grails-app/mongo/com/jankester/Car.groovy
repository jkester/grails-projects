package com.jankester


class Car {
	String name
	String brand

	int ps // horsepower 
	Date buildDate

	Date dateCreated // autoset by plugin
	Date lastUpdated // autoset by plugin

	static constraints = {
		brand nullable:true
		ps min: 30, max: 1001
	}
}
