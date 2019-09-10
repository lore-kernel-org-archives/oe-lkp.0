Content-Type: multipart/mixed; boundary="===============3979764480439772025=="
MIME-Version: 1.0
From: Hugh Dickins <hughd@google.com>
To: lkp@lists.01.org
Subject: Re: [vfs] 8bb3c61baf: vm-scalability.median -23.7% regression
Date: Mon, 09 Sep 2019 23:27:15 -0700
Message-ID: <alpine.LSU.2.11.1909092301120.1267@eggly.anvils>
In-Reply-To: <20190909035653.GF1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3979764480439772025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Sep 2019, Al Viro wrote:
> =

> Anyway, see vfs.git#uncertain.shmem for what I've got with those folded i=
n.
> Do you see any problems with that one?  That's the last 5 commits in ther=
e...

It's mostly fine, I've no problem with going your way instead of what
we had in mmotm; but I have seen some problems with it, and had been
intending to send you a fixup patch tonight (shmem_reconfigure() missing
unlock on error is the main problem, but there are other fixes needed).

But I'm growing tired. I've a feeling my "swap" of the mpols, instead
of immediate mpol_put(), was necessary to protect against a race with
shmem_get_sbmpol(), but I'm not clear-headed enough to trust myself on
that now.  And I've a mystery to solve, that shmem_reconfigure() gets
stuck into showing the wrong error message.

Tomorrow....

Oh, and my first attempt to build and boot that series over 5.3-rc5
wouldn't boot. Luckily there was a tell-tale "i915" in the stacktrace,
which reminded me of the drivers/gpu/drm/i915/gem/i915_gemfs.c fix
we discussed earlier in the cycle.  That is of course in linux-next
by now, but I wonder if your branch ought to contain a duplicate of
that fix, so that people with i915 doing bisections on 5.4-rc do not
fall into an unbootable hole between vfs and gpu merges.

Hugh

--===============3979764480439772025==--

