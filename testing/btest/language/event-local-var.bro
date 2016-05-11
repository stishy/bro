# @TEST-EXEC-FAIL: bro -b %INPUT &> out
# @TEST-EXEC: btest-diff out


event e1(num: count)
	{
	print fmt("event 1: %s", num);
	}

event bro_init()
{
	# Test assigning a local event variable to an event
	local v: event(num: count);
	v = e1;
	schedule 1sec { v(6) };  # This should fail
}
