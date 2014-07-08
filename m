Content-Type: multipart/mixed; boundary="===============7182087968654687155=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [timer] BUG: soft lockup - CPU#1 stuck for 23s! [swapper/0:1]
Date: Tue, 08 Jul 2014 18:18:41 +0800
Message-ID: <20140708101841.GA26073@localhost>
In-Reply-To: <alpine.DEB.2.10.1407081208060.4357@nanos>
List-Id: <oe-lkp.lists.linux.dev>

--===============7182087968654687155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 08, 2014 at 12:08:53PM +0200, Thomas Gleixner wrote:
> On Tue, 8 Jul 2014, Fengguang Wu wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 1ead65812486cda65093683a99b8907a7242fa93
> > Merge: b6d739e b97f029
> > Author:     Linus Torvalds <torvalds@linux-foundation.org>
> > AuthorDate: Tue Apr 1 11:00:07 2014 -0700
> > Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> > CommitDate: Tue Apr 1 11:00:07 2014 -0700
> =

> That's not really helpful. It's a merge commit, so we'd need to drill
> down the bisect into what got merged.

Yes, it is. We'll try to refine the bisect.

Thanks,
Fengguang

--===============7182087968654687155==--

