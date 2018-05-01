#!/usr/bin/ruby

require 'colorize'

version=0.1


if ARGV.length >= 1
	# Install new package
	if ARGV[0] == "-S"
		if ARGV.length < 2
			puts "Usage: umbra -S <package_name>"
		else
			puts "Checking if the package is already available in the official repositories..."
			%x(sudo pacman -S #{ARGV[1]})
		end
	elsif ARGV[0] == "-Syu"
		# TODO: Update AUR packages too
		puts "Updating official packages..."
		%x(sudo pacman -Syu)
	# Show package version
	elsif ARGV[0] == "-v"
		puts "Umbra AUR helper, version #{version}"
		puts "Developed by end222"
	end
else
	puts "No operation code was given"
	puts "Usage: umbra <operation> [package_name]"
end
