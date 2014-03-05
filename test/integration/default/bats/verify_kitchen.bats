@test "jenkins is available on port 8080" {
	wget -O - http://localhost:8080 2>&1 | grep 'Dashboard \[Jenkins\]'
}

@test "kitchen is executable" {
	which kitchen
}

@test "foodcritic is executable" {
	which foodcritic
}

@test "git is executable" {
	which git
}

@test "berkshelf is executable" {
	which berkshelf
}

@test "chefspec is executable" {
	which chefspec
}
