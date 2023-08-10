<!--- 
 *
 * Copyright (c) 2015, Lucee Association Switzerland. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either 
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public 
 * License along with this library.  If not, see <http://www.gnu.org/licenses/>.
 * 
 ---><cfcomponent extends="Cache">
	
    <cfset fields=array(
		field("Servers","servers","",true,"Please define here a list of all servers you would like to connect to, please follow this pattern:<br> Host:Port&lt;new line><br> Host:Port&lt;new line><br>Host:Port","textarea")
		,field("Expires","default_expires","600",false,
			"default expires time for elements in cache","time")
		,field('Failure Mode','failure_mode','Redistribute',true,
			'Failure modes for node failures'
			,"radio",'Redistribute,Retry,Cancel')
		,field('Protocol','protocol','Binary',true,
			'specify the protocol to use'
			,"radio",'Binary,Text')
		,field('Compress','compress','true',true,
			'if enabled all objects bigger than 1mb get compressed (GZIP) when written to the cache and uncompressed when read again from the cache.'
			,"checkbox")
		,field("Log","log","",false,"Name of an existing log you would like to store information into.","text")
		
	)>
    
	<cffunction name="getClass" returntype="string">
    	<cfreturn "{class}">
    </cffunction>
    
	<cffunction name="getLabel" returntype="string">
    	<cfreturn "{label}">
    </cffunction>
	<cffunction name="getDescription" returntype="string" output="no">
    	<cfreturn "{desc}">
    </cffunction>
    
</cfcomponent>
