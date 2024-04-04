#!/usr/bin/env bash

case "$package_manager" in
	apt)
		ruby_dependencies=(
			make
			gcc
			zlib1g-dev
			libssl-dev
			libxml2
			libyaml-dev
		)
		;;
	dnf|yum)
		ruby_dependencies=(
			make
			gcc
			zlib-devel
			openssl-devel
			libxml2
			libyaml-devel
		)
		;;
	pacman)
		ruby_dependencies=(
			make
			gcc
			zlib
			openssl
			libxml2
			libyaml
		)
		;;
	zypper)
		ruby_dependencies=(
			make
			gcc
			zlib-devel
			libopenssl-devel
			libxml2
			libyaml-devel
		)
		;;
	port)
		ruby_dependencies=(
			openssl
			libyaml
		)
		;;
	brew)
		ruby_dependencies=(
			openssl@1.1
			libyaml
		)
		;;
	pkg)
		ruby_dependencies=(
			gmake
			gcc
			openssl
			libxml2
			libyaml
		)
		;;
	xbps)
		ruby_dependencies=(
			base-devel
			openssl-devel
			zlib-devel
			libxml2
			libyaml-devel
		)
		;;
esac
