##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Saman-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-03-13
version "0.1"
description "Saman Portal - Homepage: http://www.sis-eg.com/"

# ShodanHQ results as at 2012-03-13 #
# 7 for SAMANPORTALSID
# 3 for X-Powered-By: sisRapid Framework

# Google results as at 2012-03-13 #
# 89 for inurl:sismodule=user

# Dorks #
dorks [
'inurl:sismodule=user'
]

# Examples #
examples %w|
www.shomanews.com
portal.merc.ac.ir
www.irannsr.org
www.sinainsurance.com
portal.irannsr.org
77.237.91.57
195.146.59.31
80.191.8.14
62.193.12.206
82.99.218.78
|

# Matches #
matches [

# Meta Generator
{ :text=>'<meta name="Generator" content="Saman Information Structure" />' },

# Link # Version Detection
{ :version=>/<script  type="text\/javascript" language="JavaScript" src="\/portlets\/sisRapid\/dream\/libs\/(V[\d\.]+)\/core\/sisValidationAPI\.js">/ },

# JavaScript
{ :regexp=>/<script  type="text\/javascript" language="JavaScript">[\s]+var sisTHEMEPATH_HTTP = "/ },

# X-Powered-By: sisRapid Framework
{ :search=>"headers[server]", :regexp=>/sisRapid Framework/ },

# Set-Cookie # SAMANPORTALSID
{ :search=>"headers[set-cookie]", :regexp=>/SAMANPORTALSID=[^;]+;/ },

]

end

