Content-Type: multipart/mixed; boundary="===============0342760974658740320=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/copy_mc] a0ac629ebe: fio.read_iops -43.3% regression
Date: Tue, 22 Sep 2020 17:26:41 -0700
Message-ID: <CAPcyv4jk8TRDSJVmN_sAbqkHAQa4gvE2_k4Vrg1aUOikX44yMA@mail.gmail.com>
In-Reply-To: <20200806153500.GC2131635@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0342760974658740320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2020 at 8:35 AM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Dan Williams <dan.j.williams@intel.com> wrote:
>
> > On Thu, Aug 6, 2020 at 6:35 AM Ingo Molnar <mingo@kernel.org> wrote:
> > >
> > >
> > > * kernel test robot <rong.a.chen@intel.com> wrote:
> > >
> > > > Greeting,
> > > >
> > > > FYI, we noticed a -43.3% regression of fio.read_iops due to commit:
> > > >
> > > >
> > > > commit: a0ac629ebe7b3d248cb93807782a00d9142fdb98 ("x86/copy_mc: Int=
roduce copy_mc_generic()")
> > > > url: https://github.com/0day-ci/linux/commits/Dan-Williams/Renovate=
-memcpy_mcsafe-with-copy_mc_to_-user-kernel/20200802-014046
> > > >
> > > >
> > > > in testcase: fio-basic
> > > > on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GH=
z with 256G memory
> > > > with following parameters:
> > >
> > > So this performance regression, if it isn't a spurious result, looks
> > > concerning. Is this expected?
> >
> > This is not expected and I think delays these patches until I'm back
> > from leave in a few weeks. I know that we might lose some inlining
> > effect due to replacing native memcpy, but I did not expect it would
> > have an impact like this. In my testing I was seeing a performance
> > improvement from replacing the careful / open-coded copy with rep;
> > mov;, which increases the surprise of this result.
>
> It would be nice to double check this on the kernel-test-robot side as
> well, to make sure it's not a false positive.

Circling back to this, I found the bug. This incremental patch nearly
doubles the iops in the case when copy_mc_fragile() is enabled because
it was turning around and redoing the copy with copy_mc_generic(). So
this would have been a regression for existing systems that indicate
that "carefu/fragilel" copying can avoid some PCC=3D1 machine checks. My
performance checkout was comparing copy_mc_fragile() and
copy_mc_generic() in isolation. Refreshed patches inbound.

diff --git a/arch/x86/lib/copy_mc.c b/arch/x86/lib/copy_mc.c
index 9e6fac1ab72e..afac844c8f45 100644
--- a/arch/x86/lib/copy_mc.c
+++ b/arch/x86/lib/copy_mc.c
@@ -58,7 +58,8 @@ copy_mc_to_user(void *to, const void *from, unsigned len)
        __uaccess_begin();
        if (static_branch_unlikely(&copy_mc_fragile_key))
                ret =3D copy_mc_fragile(to, from, len);
-       ret =3D copy_mc_generic(to, from, len);
+       else
+               ret =3D copy_mc_generic(to, from, len);
        __uaccess_end();
        return ret;
 }
--===============0342760974658740320==--

