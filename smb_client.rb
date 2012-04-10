# -*- coding: utf-8 -*-
#
#= The library for fromtend of smbclient.
#
#Authors::   Bragging Boozer<bragging.boozer@gmail.com>
#Version::   0.1
#License::   GPL Ver. 2.0
#Copyright:: Copyright (C) 2012 BraggingBoozer<bragging.boozer@gmail.com>. All rights reserved.
#
#This program is free software; you can redistribute it and/or modify it under
#the terms of the GNU General Public License as published by the Free Software
#Foundation; either version 2 of the License, or (at your option) any later
#version.
#        
#This program is distributed in the hope that it will be useful, but WITHOUT
#ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
#details.
#        
#You should have received a copy of the GNU General Public License along with
#this program; if not, see <http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt>.

#= Frontend class for smbclient
#
#You can access smb service with this class.
class SmbClient
  #== Initializer
  #
  #=== Parameters
  #service:: service name(UNC path)
  #password:: password for service
  #=== Returns
  #none
  #=== Note
  #Set instance variables.
  def initialize(service, password)
    @srv = service
    @pwd = password
  end

  #== Open connection
  #
  #=== Parameters
  #none
  #=== Returns
  #none
  #=== Note
  #Start smbclient and open smb connection.
  def open
    @io = IO.popen("smbclient " + @srv + " \"" + @pwd + "\"", "r+")
  end

  #== Close connection
  #
  #=== Parameters
  #none
  #=== Returns
  #none
  #=== Note
  #Close smb connection and quit smbclient.
  def close
    @io.puts "quit"
    @io.close
  end

  #== Change directory
  #
  #=== Parameters
  #dir:: target directory
  #=== Returns
  #none
  #=== Note
  #Change current directory.
  def chdir(dir)
    @io.puts "cd " + dir
  end

  #== Get file
  #
  #=== Parameters
  #filename:: target file
  #=== Returns
  #file in the local directory
  #=== Note
  #Retrieve file from remote current directory.
  def get(filename)
    @io.puts "get " + filename
  end

  #== Put file
  #
  #=== Parameters
  #filename:: target file
  #=== Returns
  #none
  #=== Note
  #Store file to remote current directory.
  def put(filename)
    @io.puts "put " + filename
  end
end
