Content-Type: multipart/mixed; boundary="===============3862132950516035829=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [random] BUG: spinlock trylock failure on UP on CPU#0, swapper/1
Date: Sun, 15 Jun 2014 21:44:15 -0400
Message-ID: <20140616014415.GA4887@thunk.org>
In-Reply-To: <539D4776.1030804@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3862132950516035829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2014 at 03:12:54PM +0800, Jet Chen wrote:
> Hi Greg,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 0fb7a01af5b0cbe5bf365891fc4d186f2caa23f7
> Author:     Greg Price <price@MIT.EDU>
> AuthorDate: Thu Dec 5 19:32:19 2013 -0500
>
>     random: simplify accounting code

I believe I've found the problem, thanks for the report!

There was an earlier warning when this was in the random.git tree, but
I analyzed the bug report incorrectly and thought it was due to a bug
in lib/random32.c that would only show up in testing.  My bad for not
seeing the problem earlier.

The patch will be chained to this reply and sent to LKML.

  	       	     	 	  	     - Ted

--===============3862132950516035829==--

