Content-Type: multipart/mixed; boundary="===============5824699558041254819=="
MIME-Version: 1.0
From: NeilBrown <neilb@suse.de>
To: lkp@lists.01.org
Subject: Re: __might_sleep() warnings on v3.19-rc6
Date: Mon, 02 Feb 2015 17:09:37 +1100
Message-ID: <20150202170937.4b5ffcb0@notabene.brown>
In-Reply-To: <CA+55aFyR-ZK9Y2KkxbcTnMOcCc243ZKD6AKTuktpmyE0HCUcPw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5824699558041254819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 1 Feb 2015 21:08:12 -0800 Linus Torvalds
<torvalds@linux-foundation.org> wrote:

> On Sun, Feb 1, 2015 at 3:03 PM, NeilBrown <neilb@suse.de> wrote:
> >
> > I guess I could
> >       __set_current_state(TASK_RUNNING);
> > somewhere to defeat the warning, and add a comment explaining why.
> >
> > Would that be a good thing?
> =

> Use "sched_annotate_sleep()" instead, but yes, add a comment about why it=
's ok.
> =

>                         Linus
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

OK - following patch is queued to appear in a pull request tomorrow  (I hop=
e).

Thanks,
NeilBrown

From: NeilBrown <neilb@suse.de>
Date: Mon, 2 Feb 2015 17:08:03 +1100
Subject: [PATCH] md/bitmap: fix a might_sleep() warning.

commit 8eb23b9f35aae413140d3fda766a98092c21e9b0
    sched: Debug nested sleeps

causes false-positive warnings in RAID5 code.

This annotation removes them and adds a comment
explaining why there is no real problem.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: NeilBrown <neilb@suse.de>

diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
index da3604e73e8a..1695ee5f3ffc 100644
--- a/drivers/md/bitmap.c
+++ b/drivers/md/bitmap.c
@@ -72,6 +72,19 @@ __acquires(bitmap->lock)
 	/* this page has not been allocated yet */
 =

 	spin_unlock_irq(&bitmap->lock);
+	/* It is possible that this is being called inside a
+	 * prepare_to_wait/finish_wait loop from raid5c:make_request().
+	 * In general it is not permitted to sleep in that context as it
+	 * can cause the loop to spin freely.
+	 * That doesn't apply here as we can only reach this point
+	 * once with any loop.
+	 * When this function completes, either bp[page].map or
+	 * bp[page].hijacked.  In either case, this function will
+	 * abort before getting to this point again.  So there is
+	 * no risk of a free-spin, and so it is safe to assert
+	 * that sleeping here is allowed.
+	 */
+	sched_annotate_sleep();
 	mappage =3D kzalloc(PAGE_SIZE, GFP_NOIO);
 	spin_lock_irq(&bitmap->lock);
=20

--===============5824699558041254819==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSVZBd1VC
Vk04VW9UbnNudDFXWW9HNUFRTGc4aEFBZ2RTV1htNnZMZUVJM3A0T2NJTlpJM2EvZ2tVS3RmR3AK
eFVhNTRBVG5JU2Jybkh0N2Y3Tm5yV21MeWJUU25rUHZER3o3MkN1eXRia2hlZHBGcTdRNW5TTzA0
UkNCM2ZQWAp1MVVMMnNVaGNkZFFlRkxZK3dGSEVQTFFsVFZjVExzYllLNG1lMFJTY0RyTGpabkhC
bFFqNWNHdTVSZTJVaFhtClFydzRSeXZybEVKd0VBaC82RHBXalVCNHhNLzQ0RWJGVXpGVlp5alBu
enlEUmtQcFBqK0d3Zk1VWkdtNjJ5b1EKVFFyL0dVZWtUMmh1UlhkMEN6angzNmpFclNSQXFKaDBh
M093azZnVWZXZW9VQVJicUtLczZDc3lBRlVydE1KcApzZlVPN3hpNGhZT21MS0RSbTZ4VmIzKzNF
VXZWMHFkdDlFdkdMUmU1OFZCdkZKYkV2OElYY1lKVVlhd2JsSXQrCjAxeFZUcEV0WjRtTngvSnBy
bnBaMldreGw1ZEdyazVuSVR5eXVxdElEU0FiSi91NjVPTkF2bllCREk0eHRjMUIKNm8zS2RxM21V
UXFoMGV1ZTRUTDloWkw3MWxRQ2RPSTl6R1NEUlZFMEQ4NEF1K2dXRHM1WFJYZ2pmRHU1Q1J5bApk
ZzdRK0VNRlVXd2NkZ0xUdjFObnZuVlhWZXdxMERkMVFFMVhDNm9jVHBGeEhHU3ZYMWpWdG05ZDhK
eUdjTTd2ClpVMm4xRVd1U1B4RkMzSU4vcmsydjJFVXdnN2o3cVBoK1o1Um1xM00zZ2kxS2R3TTRo
S0lZUnVzc3ZTSDdWM0YKMkRsenluRmMxUzVoWTEvN1pMTUFSMEpUb2ZDWHVmSHRmV01ObWxFa01H
c21CcEZIdU1IUzVwN0RzbFdWSG9iWQpTbmFtZmcwWnBPWT0KPXBWSVkKLS0tLS1FTkQgUEdQIFNJ
R05BVFVSRS0tLS0tCg==

--===============5824699558041254819==--

