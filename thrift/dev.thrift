exception Error {
	1: i32 err_no,
	2: string err_desc,
}

struct Car {
	1: string brand,
}

service Cars {
#	map<string, string> get_car(1:Car car) throws (1:Error err),
	Car get_car(1:i32 id) throws (1:Error err),
}
