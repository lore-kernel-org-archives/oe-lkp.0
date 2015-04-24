Content-Type: multipart/mixed; boundary="===============8755365286812993267=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [fanotify] 66ba93c0d7f: i6300esb: Unexpected close, not stopping watchdog!
Date: Fri, 24 Apr 2015 10:42:09 -0700
Message-ID: <20150424104209.83834f6a22442b11086a501c@linux-foundation.org>
In-Reply-To: <1429770338.25120.2.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8755365286812993267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Apr 2015 14:25:38 +0800 Huang Ying <ying.huang@intel.com> wrot=
e:

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 66ba93c0d7fe63def447ad0afe380307ff9ebcad ("fanotify: don't set FAN=
_ONDIR implicitly on a marks ignored mask")
> =

> When doing LTP test.  Test system hang after doing some fanotify test cas=
es, while system
> can run to reboot in the parent comments.

Thanks.  I've queued a reversion patch.  I'll hold off sending it to
Linus for a while, to see if we can get this fixed up.


What does "hang" mean?  Was the machine all locked up?  Or is it the
case that the particular LTP test failed to complete?  I suspect the
latter - that the new notify behaviour is differing from LTP's
expectation in some fashion?


--===============8755365286812993267==--

