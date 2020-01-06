Content-Type: multipart/mixed; boundary="===============3666913454383169952=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpuidle] 259231a045: will-it-scale.per_process_ops -12.6% regression
Date: Mon, 06 Jan 2020 15:55:35 +0000
Message-ID: <20200106155212.GB10439@shbuild999.sh.intel.com>
In-Reply-To: <20200103133614.GA6604@fuller.cnet>
List-Id: <oe-lkp.lists.linux.dev>

--===============3666913454383169952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Marcelo,

On Fri, Jan 03, 2020 at 10:36:14AM -0300, Marcelo Tosatti wrote:
> Hi Feng,
> =

> > Anyway, I found commit 259231a04 lost one "break" when moving
> > the original code, thus the semantics is changed to the last
> > enabled state's target_residency instead of the first enabled
> > one's.
> > =

> > I don't know if it's intentional, and I guess no, so here =

> > is a fix patch, please review, thanks
> =

> Not intentional.
> =

> > But even with this patch, the regression is still not recovered.
> > =

> > - Feng
> =

> This has been fixed upstream already, should be on Rafael's GIT tree.

Glad to hear that.

> =

> > >From cddd6b409e18ce97a8d7b851db4400396f71d857 Mon Sep 17 00:00:00 2001
> > From: Feng Tang <feng.tang@intel.com>
> > Date: Thu, 2 Jan 2020 16:58:31 +0800
> > Subject: [PATCH] cpuidle: Add back the lost break in cpuidle_poll_time
> > =

> > Commit c4cbb8b649b5 move the poll time calculation into a
> > new function cpuidle_poll_time(), during which one "break"
> > get lost, and the semantic is changed from the last enabled
> > state's target_residency instead of the first enabled one's.
> > =

> > So add it back.
> > =

> > Fixes: c4cbb8b649b5 "cpuidle: add poll_limit_ns to cpuidle_device struc=
ture"
> > Signed-off-by: Feng Tang <feng.tang@intel.com>
> > Cc: Marcelo Tosatti <mtosatti@redhat.com>
> > ---
> >  drivers/cpuidle/cpuidle.c | 1 +
> >  1 file changed, 1 insertion(+)
> =

> About the regression... if you only revert the =

> =

> drivers/cpuidle/poll_state.c
> =

> changes from =

> =

> 259231a045616c4101d023a8f4dcc8379af265a6
> =

> Is the performance regression gone?

Aha, I did tried a similar patch, which can NOT cure the regression.

(You can check if the below patch complies with your idea) =


Another thing I've tried is to move the "poll_limit_ns" to the end of
struct cpuidle_device which could reduce the regression from 12.6%
to about 7.5%

Thanks,
Feng

commit 18260c38f4a802592e1cb6e82eb71ddca7709def
Author: Feng Tang <feng.tang@intel.com>
Date:   Fri Jan 3 09:21:54 2020 +0800

    make the poll_time inline
    =

    Signed-off-by: Feng Tang <feng.tang@intel.com>

diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
index c8fa5f4..e278d9e 100644
--- a/drivers/cpuidle/poll_state.c
+++ b/drivers/cpuidle/poll_state.c
@@ -22,7 +22,24 @@ static int __cpuidle poll_idle(struct cpuidle_device *de=
v,
 		unsigned int loop_count =3D 0;
 		u64 limit;
 =

-		limit =3D cpuidle_poll_time(drv, dev);
+		=

+		if (likely(dev->poll_limit_ns))
+			limit =3D dev->poll_limit_ns;
+		else {
+			int i;
+
+			limit =3D TICK_NSEC;
+			for (i =3D 1; i < drv->state_count; i++) {
+				if (drv->states[i].disabled || dev->states_usage[i].disable)
+					continue;
+
+				limit =3D (u64)drv->states[i].target_residency * NSEC_PER_USEC;
+				break;
+			}
+
+			dev->poll_limit_ns =3D limit;
+		}
+
 =

 		while (!need_resched()) {
 			cpu_relax();





--===============3666913454383169952==--

