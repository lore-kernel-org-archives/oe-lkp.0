Content-Type: multipart/mixed; boundary="===============1456908058315907277=="
MIME-Version: 1.0
From: Alan Stern <stern@rowland.harvard.edu>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Tue, 04 Jun 2019 13:00:03 -0400
Message-ID: <Pine.LNX.4.44L0.1906041251210.1731-100000@iolanthe.rowland.org>
In-Reply-To: <CAHk-=wgGnCw==uY8radrB+Tg_CEmzOtwzyjfMkuh7JmqFh+jzQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1456908058315907277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Jun 2019, Linus Torvalds wrote:

> So I don't technically disagree with anything you say,

That's good to know!

>  I just wanted
> to point out that as far as the kernel is concerned, we do have higher
> quality expectations from the compiler than just "technically valid
> according to the C standard".

Which suggests asking whether these higher expectations should be
reflected in the Linux Kernel Memory Model.  So far we have largely
avoided doing that sort of thing, although there are a few exceptions.

(For example, we assume the compiler does not destroy address
dependencies from volatile reads -- but we also warn that this
assumption may fail if the programmer does not follow some rules
described in one of Paul's documentation files.)

Alan


--===============1456908058315907277==--

