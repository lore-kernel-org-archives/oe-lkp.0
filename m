Content-Type: multipart/mixed; boundary="===============1897160279067694204=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [xarray] 0e9446c35a: WARNING:at_include/linux/xarray.h:#xa_mk_value
Date: Mon, 05 Nov 2018 14:08:47 -0800
Message-ID: <20181105220847.GA16465@bombadil.infradead.org>
In-Reply-To: <20181105180004.GA4923@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1897160279067694204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 10:00:04AM -0800, Matthew Wilcox wrote:
> On Mon, Nov 05, 2018 at 09:57:47AM -0800, Linus Torvalds wrote:
> > Should that part of the test be surrounded by #ifdef CONFIG_64BIT? Or
> > did you _want_ the warnings?
> =

> I should have just made that (1 << 24) instead of UINT_MAX.  I had forgot=
ten
> about 32-bit machines while writing that test.
> =

> That prompted me to actually build the test suite on 32-bit and there's
> a few other things in there that want fixing.  I'll have a pull request
> for you later today.

I've pushed out an update to
http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/heads/xarr=
ay

Let's give the automated testers a couple of days to chew on this before
I send you a real pull request?  The last two commits are today's work
while the other commits have been stewing in the xarray-conv branch for
the last 2-3 weeks while I've been busily converting all the radix trees
and some of the IDRs to the XArray.

They say no battle plan survives contact with the enemy ... no API
survives contact with its users.

--===============1897160279067694204==--

