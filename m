Content-Type: multipart/mixed; boundary="===============3740861163259306173=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Thu, 02 Sep 2021 09:35:58 +0800
Message-ID: <20210902013558.GA97410@shbuild999.sh.intel.com>
In-Reply-To: <877dg0wcrr.fsf@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3740861163259306173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 08:12:24AM -0700, Andi Kleen wrote:
> Feng Tang <feng.tang@intel.com> writes:
> >
> > Yes, the tests I did is no matter where the 128B padding is added, the
> > performance can be restored and even improved.
> =

> I wonder if we can find some cold, rarely accessed, data to put into the
> padding to not waste it. Perhaps some name strings? Or the destroy
> support, which doesn't sound like its commonly used.

Yes, I tried to move 'destroy_work', 'destroy_rwork' and 'parent' over
before the 'refcnt' together with some padding, it restored the performance
to about 10~15% regression. (debug patch pasted below)

But I'm not sure if we should use it, before we can fully explain the
regression.

Thanks,
Feng

commit a308d90b0d1973eb75551540a7aa849cabc8b8af
Author: Feng Tang <feng.tang@intel.com>
Date:   Sat Aug 14 16:18:43 2021 +0800

    move the member around
    =

    Signed-off-by: Feng Tang <feng.tang@intel.com>

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index f9fb7f0..255f668 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -139,10 +139,21 @@ struct cgroup_subsys_state {
 	/* PI: the cgroup that this css is attached to */
 	struct cgroup *cgroup;
 =

+	struct cgroup_subsys_state *parent;
+
 	/* PI: the cgroup subsystem that this css is attached to */
 	struct cgroup_subsys *ss;
 =

-	unsigned long pad[16];
+	/* percpu_ref killing and RCU release */
+	struct work_struct destroy_work;
+	struct rcu_work destroy_rwork;
+
+	unsigned long pad[2]; /* 128 bytes */
 =

 	/* reference count - access via css_[try]get() and css_put() */
 	struct percpu_ref refcnt;
@@ -176,6 +187,7 @@ struct cgroup_subsys_state {
 	 */
 	atomic_t online_cnt;
 =

+	#if 0
 	/* percpu_ref killing and RCU release */
 	struct work_struct destroy_work;
 	struct rcu_work destroy_rwork;
@@ -185,6 +197,7 @@ struct cgroup_subsys_state {
 	 * fields of the containing structure.
 	 */
 	struct cgroup_subsys_state *parent;
+	#endif
 };
 =

 /*


> -Andi
--===============3740861163259306173==--

