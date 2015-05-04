Content-Type: multipart/mixed; boundary="===============6333372915189411903=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [fanotify] 66ba93c0d7f: i6300esb: Unexpected close, not stopping watchdog!
Date: Mon, 04 May 2015 08:49:07 +0800
Message-ID: <1430700547.25120.132.camel@intel.com>
In-Reply-To: <20150424104209.83834f6a22442b11086a501c@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6333372915189411903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Andrew,

Sorry for late.  I am in vacation in last week.

On Fri, 2015-04-24 at 10:42 -0700, Andrew Morton wrote:
> On Thu, 23 Apr 2015 14:25:38 +0800 Huang Ying <ying.huang@intel.com> wr=
ote:
> =

> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > commit 66ba93c0d7fe63def447ad0afe380307ff9ebcad ("fanotify: don't set F=
AN_ONDIR implicitly on a marks ignored mask")
> > =

> > When doing LTP test.  Test system hang after doing some fanotify test c=
ases, while system
> > can run to reboot in the parent comments.
> =

> Thanks.  I've queued a reversion patch.  I'll hold off sending it to
> Linus for a while, to see if we can get this fixed up.
> =

> =

> What does "hang" mean?  Was the machine all locked up?  Or is it the
> case that the particular LTP test failed to complete?  I suspect the
> latter - that the new notify behaviour is differing from LTP's
> expectation in some fashion?

Sorry for confusion.  The machine was not locked up, just the LTP test
failed to complete.

Best Regards,
Huang, Ying



--===============6333372915189411903==--

