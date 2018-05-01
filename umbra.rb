#!/usr/bin/ruby

require 'colorize'

version=0.1


if ARGV.length >= 1
	# Install new package
	case ARGV[0]
	when "-S"
		if ARGV.length < 2
			puts "Usage: umbra -S <package_name>"
		else
			puts "Checking if the package is already available in the official repositories..."
			%x(sudo pacman -S #{ARGV[1]})
		end
	when "-Syu"
		# TODO: Update AUR packages too
		puts "Updating official packages..."
		%x(sudo pacman -Syu)
	# Show help page
	when "-h", "--help"
		puts "Help page"
		# TODO: write some help
	# Show package version
	when "-v"
		puts "Umbra AUR helper, version #{version}"
		puts "Developed by end222"
	else
		puts "Operation not recognized"
	end
else
	puts "No operation code was given"
	puts "Usage: umbra <operation> [package_name]"
end
