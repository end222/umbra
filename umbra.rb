#!/usr/bin/ruby

require 'colorize'

# Declaration of constants
Version=0.1
AUR_url="https://aur.archlinux.org/"

def usage_help()
	puts "Usage: umbra <operation> [package_name]"
	puts "Operations:"
	puts "-S: install a package"
	puts "-Syu: upgrade repositories and packages, including the ones from the AUR"
	puts "-h, --help: show this help page"
	puts "-v: print version of the program"
end

def check_lock()
	if File.file?("/tmp/umbra.lck")
		puts "Warning!".red
		puts "/tmp/umbra.lck exists, which means that another instance of the program is already running"
		puts "If that is not the case remove that file in order to be able to use umbra again"
		exit 1
	end
end

def pkg_install(package)
	puts "Checking if the package is already available in the official repositories..."
	system("sudo pacman -S #{ARGV[1]}")
	#TODO: Check success in the previous action and install from the AUR if it didn't suceed
	system("mkdir -p /tmp/umbra")
	system("git clone #{AUR_url}#{package}.git /tmp/umbra/#{package}")
	# s: SyncDeps
	# i: Install when finished
	# c: Clean when finished
	system("cd /tmp/umbra/#{package} && makepkg -sic")
end

def upgrade_all()
	# TODO: Update AUR packages too
	puts "Updating official packages..."
	system("sudo pacman -Syu")
end

check_lock()
%x(touch /tmp/umbra.lck)
if ARGV.length >= 1
	# Install new package
	case ARGV[0]
	when "-S"
		if ARGV.length < 2
			puts "Usage: umbra -S <package_name>"
		else
			pkg_install(ARGV[1])
		end
	when "-Syu"
		upgrade_all()
	# Show help page
	when "-h", "--help"
		usage_help()
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
%x(rm /tmp/umbra.lck)
