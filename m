Content-Type: multipart/mixed; boundary="===============7771941019050911740=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: Fwd: [rhashtable] WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:570 mutex_lock_nested()
Date: Tue, 13 Jan 2015 08:41:26 +0000
Message-ID: <20150113084126.GE20387@casper.infradead.org>
In-Reply-To: <54B4CE3E.8020009@windriver.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7771941019050911740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/13/15 at 03:50pm, Ying Xue wrote:
> On 01/12/2015 08:42 PM, Thomas Graf wrote:
> > On 01/12/15 at 09:38am, Ying Xue wrote:
> >> Hi Thomas,
> >>
> >> I am really unable to see where is wrong leading to below warning
> >> complaints. Can you please help me check it?
> > =

> > Not sure yet. It's not your patch that introduced the issue though.
> > It merely exposed the affected code path.
> >
> > Just wondering, did you test with CONFIG_DEBUG_MUTEXES enabled?
> > =

> > =

> =

> After I enable above option, I don't find similar complaints during my
> testing.

I can't reproduce it in my KVM box either so far. It looks like a
mutex_lock() on an uninitialized mutex or use after free but I can't
find such a code path so far.

--===============7771941019050911740==--

