Content-Type: multipart/mixed; boundary="===============5737836359441782515=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: : [ INFO: possible circular locking dependency detected ]
Date: Thu, 10 Sep 2015 08:29:40 +0800
Message-ID: <20150910002940.GA22498@wfg-t540p.sh.intel.com>
In-Reply-To: <20150910100628.388d594d@canb.auug.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============5737836359441782515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 10:06:28AM +1000, Stephen Rothwell wrote:
> Hi Fengguang,
> =

> On Thu, 10 Sep 2015 07:57:56 +0800 Fengguang Wu <fengguang.wu@intel.com=
> wrote:
> >
> > The root cause is interesting. A recent change flipped a test,
> > causing bisect failures (rather than success) to be emailed out.
> =

> Ooops.
> =

> > These bisect failures don't have $first_bad_commit, so the last
> > checked linux-next HEAD is picked up. That means all errors are
> > redirected to you. ;) =

> =

> nice :-(
> =

> Thanks for fixing it (you did fix it, right? :-))

Yeah, not only fixed it, but also added some more defensive checks. :)

Thanks,
Fengguang

--===============5737836359441782515==--

