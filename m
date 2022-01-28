Content-Type: multipart/mixed; boundary="===============0105933174704151625=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ocfs2] c42ff46f97: sysctl_table_check_failed
Date: Fri, 28 Jan 2022 19:16:21 +0200
Message-ID: <CAHk-=wjzWVW1xvVLCOvw-MMoVK9kiRn5CUx2am8jPdo09mHgjA@mail.gmail.com>
In-Reply-To: <87a6ffst4j.fsf@email.froward.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0105933174704151625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 6:49 PM Eric W. Biederman <ebiederm@xmission.com>=
 wrote:
>
> Yes.  There is a register_sysctl_paths that can be used if you want/need
> the embedded directories.  That probably would have been a better
> choice for an automated conversion.
>
> But since this there is only the single file in a single directory
> register_sysctl() with the full path is perfectly fine in this case.
>
> Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>

I was doing filesystem pull requests anyway, and as a result (I tend
to group things by topic if there's multiple things pending) I already
committed that patch of mine based on Jan's reviewed/tested-by, so
this reviewed-by ended up not in the tree.

But maybe somebody should check the other automated conversions for
the same issue? Hint hint.

Also, I'm somewhat unhappy about the fact that apparently the kernel
test robot already found this issue back in November of last year, yet
it made it to mainline several months later without being fixed.

It's hard to tell from this link:

  https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org/thread/KQ2F6TPJWM=
DVEXJM4WTUC4DU3EH3YJVT/

but it does look like that original report only made it to that lkp
list and not the actual people listed on the commit itself? That would
explain why the report was overlooked.

Kind of sad.

              Linus
--===============0105933174704151625==--

