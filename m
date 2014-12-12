Content-Type: multipart/mixed; boundary="===============1598310778783189543=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [ext4] fdfe0739876: Failed to mount
Date: Thu, 11 Dec 2014 23:10:27 -0500
Message-ID: <20141212041027.GD10189@thunk.org>
In-Reply-To: <1418353365.5745.95.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1598310778783189543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2014 at 11:02:45AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> After the commit, the file system failed to mount as in stderr file attac=
hed.
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> commit fdfe073987619ec375da8d8a2701ab271d1b1339 ("ext4: fix potential use=
 after free during resize")

This was dropped from the ext4 dev branch a few days ago....

     	 	      	       	   	    - Ted

--===============1598310778783189543==--

