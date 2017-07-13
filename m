Content-Type: multipart/mixed; boundary="===============6481129077662929182=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 21:15:54 -0400
Message-ID: <20170713011554.xwmrgkzfwnibvgcu@thunk.org>
In-Reply-To: <74664cc8-bc3e-75d6-5892-f8934404349f@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6481129077662929182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I'm really confused what problem that is trying to be solved, here,
but it **feels** really, really wrong.

Why do we need to store all of this state on a per-file basis, instead
of some kind of per-file system or per-container data structure?

And how many of these security.foo(a)uid=3Dbar xattrs do you expect there
to be?  How many "foo", and how many "bar"?

Maybe I missed the full write up, in which case please send me a link
to the full writeup --- ideally in the form of a design doc that
explains the problem statement, gives some examples of how it's going
to be used, what were the other alternatives that were considered, and
why they were rejected, etc.

Thanks,

					- Ted

--===============6481129077662929182==--

