Content-Type: multipart/mixed; boundary="===============8266418524519423634=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [loop] 322c4293ec: xfstests.xfs.049.fail
Date: Mon, 20 Dec 2021 12:58:23 +0100
Message-ID: <20211220115823.GB20005@quack2.suse.cz>
In-Reply-To: <dd707dfd-6421-b1df-4820-e30787b84181@i-love.sakura.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============8266418524519423634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 20-12-21 00:45:46, Tetsuo Handa wrote:
> On 2021/12/20 0:09, kernel test robot wrote:
> >     @@ -13,3 +13,5 @@
> >      --- clean
> >      --- umount ext2 on xfs
> >      --- umount xfs
> >     +!!! umount xfs failed
> >     +(see /lkp/benchmarks/xfstests/results//xfs/049.full for details)
> >     ...
> >     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/049.out /lkp/bench=
marks/xfstests/results//xfs/049.out.bad'  to see the entire diff)
> =

> Yes, we know this race condition can happen.
> =

> https://lkml.kernel.org/r/16c7d304-60ef-103f-1b2c-8592b48f47c6(a)i-love.s=
akura.ne.jp
> https://lkml.kernel.org/r/YaYfu0H2k0PSQL6W(a)infradead.org
> =

> Should we try to wait for autoclear operation to complete?

So I think we should try to fix this because as Dave writes in the
changelog for a1ecac3b0656 ("loop: Make explicit loop device destruction
lazy") which started all this, having random EBUSY failures (either from
losetup or umount) is annoying and you need to work it around it lots of
unexpected places.

We cannot easily wait for work completion in the loop device code without
reintroducing the deadlock - whole lo_release() is called under
disk->open_mutex which you also need to grab in __loop_clr_fd(). So to
avoid holding backing file busy longer than expected, we could use
task_work instead of ordinary work as I suggested - but you were right that
we need to be somewhat careful and in case we are running in a kthread, we
would still need to offload to a normal work (but in that case we don't
care about delaying file release anyway).

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
--===============8266418524519423634==--

