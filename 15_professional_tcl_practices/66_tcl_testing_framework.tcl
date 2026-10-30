puts "===== TCL TESTING FRAMEWORK ====="

set total_tests 0
set passed_tests 0
set failed_tests 0

proc assert_equal {test_name actual expected} {
    global total_tests passed_tests failed_tests

    incr total_tests

    if {$actual eq $expected} {
        puts "PASS: $test_name"
        incr passed_tests
    } else {
        puts "FAIL: $test_name"
        puts "  Expected: $expected"
        puts "  Actual:   $actual"
        incr failed_tests
    }
}

proc add_values {a b} {
    return [expr {$a + $b}]
}

proc calculate_area {width height} {
    return [expr {$width * $height}]
}

proc calculate_slack {required arrival} {
    return [expr {$required - $arrival}]
}

puts "\nRUNNING TEST CASES"

assert_equal "Addition test" [add_values 10 20] 30
assert_equal "Area test" [calculate_area 10 5] 50
assert_equal "Slack test" [calculate_slack 10 7] 3
assert_equal "Zero test" [add_values 0 0] 0

puts "\n===== TEST SUMMARY ====="
puts "Total Tests: $total_tests"
puts "Passed: $passed_tests"
puts "Failed: $failed_tests"

if {$failed_tests == 0} {
    puts "Testing Status: ALL TESTS PASSED"
} else {
    puts "Testing Status: TESTS FAILED"
}

puts "\n===== TESTING COMPLETED ====="






# Output:
# ===== TCL TESTING FRAMEWORK =====

# RUNNING TEST CASES
# PASS: Addition test
# PASS: Area test
# PASS: Slack test
# PASS: Zero test

# ===== TEST SUMMARY =====
# Total Tests: 4
# Passed: 4
# Failed: 0
# Testing Status: ALL TESTS PASSED

# ===== TESTING COMPLETED =====