Content-Type: multipart/mixed; boundary="===============5655082861233838746=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Thu, 13 Jul 2017 07:11:36 -0500
Message-ID: <87y3rscz9j.fsf@xmission.com>
In-Reply-To: <20170713011554.xwmrgkzfwnibvgcu@thunk.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5655082861233838746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Theodore Ts'o <tytso@mit.edu> writes:

> I'm really confused what problem that is trying to be solved, here,
> but it **feels** really, really wrong.
>
> Why do we need to store all of this state on a per-file basis, instead
> of some kind of per-file system or per-container data structure?
>
> And how many of these security.foo(a)uid=3Dbar xattrs do you expect there
> to be?  How many "foo", and how many "bar"?
>
> Maybe I missed the full write up, in which case please send me a link
> to the full writeup --- ideally in the form of a design doc that
> explains the problem statement, gives some examples of how it's going
> to be used, what were the other alternatives that were considered, and
> why they were rejected, etc.

The concise summary:

Today we have the xattr security.capable that holds a set of
capabilities that an application gains when executed.  AKA setuid root exec
without actually being setuid root.

User namespaces have the concept of capabilities that are not global but
are limited to their user namespace.  We do not currently have
filesystem support for this concept.

We currently have two proposals on the table.  One is to bump the
revision number of security.capable and add more information in that xattr.
The other is to use a sligthly different capability name.

We are currently evaluating between the two proposals.

Given that it appears the IMA xattrs will want similar treatment coming
up with a good pattern to follow is part of the analysis here.

Eric

--===============5655082861233838746==--

