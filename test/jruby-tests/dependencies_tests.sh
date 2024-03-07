#!/usr/bin/env bash

. ./test/helper.sh
. ./share/ruby-install/ruby-install.sh

function setUp()
{
	ruby="jruby"
	ruby_version="9.4.3.0"
}

function test_when_package_manager_is_apt()
{
	local original_package_manager="$package_manager"
	package_manager="apt"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "openjdk-8-jdk"

	package_manager="$original_package_manager"
}

function test_when_package_manager_is_dnf()
{
	local original_package_manager="$package_manager"
	package_manager="dnf"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "java-openjdk"

	package_manager="$original_package_manager"
}

function test_when_package_manager_is_yum()
{
	local original_package_manager="$package_manager"
	package_manager="yum"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "java-openjdk"

	package_manager="$original_package_manager"
}

function test_when_package_manager_is_pacman()
{
	local original_package_manager="$package_manager"
	package_manager="pacman"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "jre8-openjdk"

	package_manager="$original_package_manager"
}

function test_when_package_manager_is_zypper()
{
	local original_package_manager="$package_manager"
	package_manager="zypper"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "java-1.8.0-openjdk"

	package_manager="$original_package_manager"
}

function test_when_package_manager_is_pkg()
{
	local original_package_manager="$package_manager"
	package_manager="pkg"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "openjdk"

	package_manager="$original_package_manager"
}

function test_when_package_manager_is_xbps()
{
	local original_package_manager="$package_manager"
	package_manager="xbps"

	source "$ruby_install_dir/$ruby/dependencies.sh"

	assertEquals "did not correctly set \$ruby_dependencies" \
		     "${ruby_dependencies[*]}" \
		     "openjdk"

	package_manager="$original_package_manager"
}

function tearDown()
{
	unset ruby ruby_version ruby_dependencies
}

SHUNIT_PARENT=$0 . $SHUNIT2
