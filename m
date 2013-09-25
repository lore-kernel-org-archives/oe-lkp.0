Content-Type: multipart/mixed; boundary="===============5076290678146756603=="
MIME-Version: 1.0
From: Lin Ming <minggr@gmail.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 00:02:24 +0800
Message-ID: <1380124944.27676.1.camel@monkey32>
In-Reply-To: <5242C960.7050506@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5076290678146756603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2013-09-25 at 07:30 -0400, Peter Hurley wrote:
> On 09/25/2013 05:04 AM, Lin Ming wrote:
> > On Wed, Sep 18, 2013 at 8:22 AM, Peter Hurley <peter@hurleysoftware.c=
om> wrote:
> > [snip]
> >>
> >> Looking over vmalloc.c, the critical section footprint of the vmap_are=
a_lock
> >> could definitely be reduced (even nearly eliminated), but that's a pro=
ject
> >> for
> >> another day :)
> >
> > Hi Peter,
> >
> > I also looked over vmallo.c, but didn't find obvious way to reduce the
> > critical section footprint.
> > Could you share some hints how to do this?
> =

> vmap_area_list is an RCU list.
> get_vmalloc_info() doesn't need to take the vmap_area_lock at all.
> Look at __purge_vmap_area_lazy() for a howto.

Would you like below patch?

From: Lin Ming <minggr@gmail.com>
Date: Wed, 25 Sep 2013 23:48:19 +0800
Subject: [PATCH] mm/vmalloc.c: eliminate vmap_area_lock in get_vmalloc_info=
()

vmap_area_list is an RCU list.
get_vmalloc_info() doesn't need to take the vmap_area_lock at all.
Use RCU to protect list scan.

Signed-off-by: Lin Ming <minggr@gmail.com>
---
 mm/vmalloc.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 13a5495..4523c9c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2684,14 +2684,14 @@ void get_vmalloc_info(struct vmalloc_info *vmi)
 =

 	prev_end =3D VMALLOC_START;
 =

-	spin_lock(&vmap_area_lock);
+	rcu_read_lock();
 =

 	if (list_empty(&vmap_area_list)) {
 		vmi->largest_chunk =3D VMALLOC_TOTAL;
 		goto out;
 	}
 =

-	list_for_each_entry(va, &vmap_area_list, list) {
+	list_for_each_entry_rcu(va, &vmap_area_list, list) {
 		unsigned long addr =3D va->va_start;
 =

 		/*
@@ -2718,7 +2718,7 @@ void get_vmalloc_info(struct vmalloc_info *vmi)
 		vmi->largest_chunk =3D VMALLOC_END - prev_end;
 =

 out:
-	spin_unlock(&vmap_area_lock);
+	rcu_read_unlock();
 }
 #endif
 =

-- =

1.7.2.5



> =

> Regards,
> Peter Hurley
> =




--===============5076290678146756603==--

