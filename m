Content-Type: multipart/mixed; boundary="===============7050578842530953479=="
MIME-Version: 1.0
From: Marcelo Tosatti <mtosatti@redhat.com>
To: lkp@lists.01.org
Subject: Re: [cpuidle] 259231a045: will-it-scale.per_process_ops -12.6% regression
Date: Mon, 06 Jan 2020 12:49:00 +0000
Message-ID: <20200103133614.GA6604@fuller.cnet>
In-Reply-To: <20200103023117.GA1313@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7050578842530953479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Feng,

On Fri, Jan 03, 2020 at 10:31:17AM +0800, Feng Tang wrote:
> On Tue, Dec 31, 2019 at 01:59:23PM +0800, Feng Tang wrote:
> > Hi Marcelo,
> > =

> > On Wed, Sep 18, 2019 at 10:13:34AM +0800, kernel test robot wrote:
> > > Greeting,
> > > =

> > > FYI, we noticed a -12.6% regression of will-it-scale.per_process_ops =
due to commit:
> > > =

> > > =

> > > commit: 259231a045616c4101d023a8f4dcc8379af265a6 ("cpuidle: add poll_=
limit_ns to cpuidle_device structure")
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
> > =

> > Any comments on this? We re-run the test for 5.5-rc1, and the regressio=
n remains.
> =

> Anyway, I found commit 259231a04 lost one "break" when moving
> the original code, thus the semantics is changed to the last
> enabled state's target_residency instead of the first enabled
> one's.
> =

> I don't know if it's intentional, and I guess no, so here =

> is a fix patch, please review, thanks

Not intentional.

> But even with this patch, the regression is still not recovered.
> =

> - Feng

This has been fixed upstream already, should be on Rafael's GIT tree.

> >From cddd6b409e18ce97a8d7b851db4400396f71d857 Mon Sep 17 00:00:00 2001
> From: Feng Tang <feng.tang@intel.com>
> Date: Thu, 2 Jan 2020 16:58:31 +0800
> Subject: [PATCH] cpuidle: Add back the lost break in cpuidle_poll_time
> =

> Commit c4cbb8b649b5 move the poll time calculation into a
> new function cpuidle_poll_time(), during which one "break"
> get lost, and the semantic is changed from the last enabled
> state's target_residency instead of the first enabled one's.
> =

> So add it back.
> =

> Fixes: c4cbb8b649b5 "cpuidle: add poll_limit_ns to cpuidle_device structu=
re"
> Signed-off-by: Feng Tang <feng.tang@intel.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> ---
>  drivers/cpuidle/cpuidle.c | 1 +
>  1 file changed, 1 insertion(+)

About the regression... if you only revert the =


drivers/cpuidle/poll_state.c

changes from =


259231a045616c4101d023a8f4dcc8379af265a6

Is the performance regression gone?

--===============7050578842530953479==--

