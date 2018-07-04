Content-Type: multipart/mixed; boundary="===============8510577597681029323=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 5c6de586e8: vm-scalability.throughput +12.4% improvement (from reorganizing struct inode?)
Date: Thu, 05 Jul 2018 00:34:15 +0100
Message-ID: <20180704233415.GA30522@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFy-tgKkq_oiQaZge3URgZL0ruvoJ6pUCf=H+aschPdqAw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8510577597681029323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 11:59:30AM -0700, Linus Torvalds wrote:
> On Sun, Jul 1, 2018 at 11:27 PM Amir Goldstein <amir73il@gmail.com> wro=
te:
> >
> > This may be a test fluctuation or as a result of moving
> > i_blkbits closer to i_bytes and i_lock.
> =

> Hey, I certainly am not against shrinking the inode (and in general,
> removing 'enum's from internal structures), although that benchmark
> improvement looks suspiciously large. The kernel test robot is lovely,
> but some of the performance fluctuations may be more noise than
> others.
> =

> I was hoping the patch would go through the regular vfs tree, though. Al?

Sure, but
	* please, repost it.  github's webshite is atrocious ;-/
	* I would like more details about the variation of timing -
what's the dispersion from boot to boot, for starters?

I don't hate that patch, but there are immediate followup questions - e.g.
how sensitive is relative position of i_lock/i_hash/i_sb?  Those are *not*
close to each other.  E.g. what happens if one moves i_hash right after
i_ino?

--===============8510577597681029323==--

