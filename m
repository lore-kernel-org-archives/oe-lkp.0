Content-Type: multipart/mixed; boundary="===============9215900931869168817=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: lkp@lists.01.org
Subject: Re: [mm/slub] 555b8c8cb3: WARNING:at_lib/stackdepot.c:#stack_depot_fetch
Date: Tue, 05 Apr 2022 13:07:53 +0200
Message-ID: <YkwjCUbTbRqslphe@elver.google.com>
In-Reply-To: <Ykui2prpzkMvaWBa@hyeyoo>
List-Id: <oe-lkp.lists.linux.dev>

--===============9215900931869168817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 11:00AM +0900, Hyeonggon Yoo wrote:
> On Mon, Apr 04, 2022 at 05:18:16PM +0200, Marco Elver wrote:
> > On Mon, 4 Apr 2022 at 16:20, Vlastimil Babka <vbabka@suse.cz> wrote:
[...]
> > > But here we are in mem_dump_obj() -> kmem_dump_obj() -> kmem_obj_info=
().
> > > Because kmem_valid_obj() returned true, fooled by folio_test_slab()
> > > returning true because of the /* Set required slab fields. */ code.
> > > Yet the illusion is not perfect and we read garbage instead of a valid
> > > stackdepot handle.
> > >
> > > IMHO we should e.g. add the appropriate is_kfence_address() test into
> > > kmem_valid_obj(), to exclude kfence-allocated objects? Sounds much si=
mpler
> > > than trying to extend the illusion further to make kmem_dump_obj() wo=
rk?
> > > Instead kfence could add its own specific handler to mem_dump_obj() t=
o print
> > > its debugging data?
> > =

> > I think this explanation makes sense!  Indeed, KFENCE already records
> > allocation stacks internally anyway, so it should be straightforward
> > to convince it to just print that.
> >
> =

> Thank you both! Yeah the explanation makes sense... thats why KASAN/KCSAN=
 couldn't yield anything -- it was not overwritten.
> =

> I'm writing a fix and will test if the bug disappears.
> This may take few days.

The below should fix it -- I'd like to make kmem_obj_info() do something
useful for KFENCE objects.

I lightly tested it by calling mem_dump_obj() on a KFENCE object, and
prior to the below patch it'd produce garbage data.

Does that look reasonable to you?

Thanks,
-- Marco

------ >8 ------

>From 09f32964284110846ded8ade9a1a2bfcb17dc58e Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Tue, 5 Apr 2022 12:43:48 +0200
Subject: [PATCH RFC] kfence, slab, slub: support kmem_obj_info() with KFENCE
 objects

Calling kmem_obj_info() on KFENCE objects has been producing garbage
data due to the object not actually being maintained by SLAB or SLUB.

Fix this by asking KFENCE to copy missing KFENCE-specific information to
struct kmem_obj_info when the object was allocated by KFENCE.

Link: https://lore.kernel.org/all/20220323090520.GG16885(a)xsang-OptiPlex-9=
020/
Fixes: b89fb5ef0ce6 ("mm, kfence: insert KFENCE hooks for SLUB")
Fixes: d3fb45f370d9 ("mm, kfence: insert KFENCE hooks for SLAB")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kfence.h | 22 ++++++++++++++++++++++
 mm/kfence/core.c       | 21 ---------------------
 mm/kfence/kfence.h     | 21 +++++++++++++++++++++
 mm/kfence/report.c     | 34 ++++++++++++++++++++++++++++++++++
 mm/slab.c              |  4 ++++
 mm/slub.c              |  4 ++++
 6 files changed, 85 insertions(+), 21 deletions(-)

diff --git a/include/linux/kfence.h b/include/linux/kfence.h
index f49e64222628..4a7c633cb219 100644
--- a/include/linux/kfence.h
+++ b/include/linux/kfence.h
@@ -204,6 +204,23 @@ static __always_inline __must_check bool kfence_free(v=
oid *addr)
  */
 bool __must_check kfence_handle_page_fault(unsigned long addr, bool is_wri=
te, struct pt_regs *regs);
 =

+#ifdef CONFIG_PRINTK
+struct kmem_obj_info;
+/**
+ * kfence_kmem_obj_info() - fill kmem_obj_info struct
+ * @kpp: kmem_obj_info to be filled
+ * @object: the object
+ *
+ * Return:
+ * * false - not a KFENCE object
+ * * true - a KFENCE object and filled @kpp
+ *
+ * Copies information to @kpp that kmem_obj_info() is unable to populate f=
or
+ * KFENCE objects.
+ */
+bool kfence_kmem_obj_info(struct kmem_obj_info *kpp, void *object);
+#endif
+
 #else /* CONFIG_KFENCE */
 =

 static inline bool is_kfence_address(const void *addr) { return false; }
@@ -221,6 +238,11 @@ static inline bool __must_check kfence_handle_page_fau=
lt(unsigned long addr, boo
 	return false;
 }
 =

+#ifdef CONFIG_PRINTK
+struct kmem_obj_info;
+static inline bool kfence_kmem_obj_info(struct kmem_obj_info *kpp, void *o=
bject) { return false; }
+#endif
+
 #endif
 =

 #endif /* _LINUX_KFENCE_H */
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index a203747ad2c0..9b2b5f56f4ae 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -231,27 +231,6 @@ static bool kfence_unprotect(unsigned long addr)
 	return !KFENCE_WARN_ON(!kfence_protect_page(ALIGN_DOWN(addr, PAGE_SIZE), =
false));
 }
 =

-static inline struct kfence_metadata *addr_to_metadata(unsigned long addr)
-{
-	long index;
-
-	/* The checks do not affect performance; only called from slow-paths. */
-
-	if (!is_kfence_address((void *)addr))
-		return NULL;
-
-	/*
-	 * May be an invalid index if called with an address at the edge of
-	 * __kfence_pool, in which case we would report an "invalid access"
-	 * error.
-	 */
-	index =3D (addr - (unsigned long)__kfence_pool) / (PAGE_SIZE * 2) - 1;
-	if (index < 0 || index >=3D CONFIG_KFENCE_NUM_OBJECTS)
-		return NULL;
-
-	return &kfence_metadata[index];
-}
-
 static inline unsigned long metadata_to_pageaddr(const struct kfence_metad=
ata *meta)
 {
 	unsigned long offset =3D (meta - kfence_metadata + 1) * PAGE_SIZE * 2;
diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
index 9a6c4b1b12a8..600f2e2431d6 100644
--- a/mm/kfence/kfence.h
+++ b/mm/kfence/kfence.h
@@ -96,6 +96,27 @@ struct kfence_metadata {
 =

 extern struct kfence_metadata kfence_metadata[CONFIG_KFENCE_NUM_OBJECTS];
 =

+static inline struct kfence_metadata *addr_to_metadata(unsigned long addr)
+{
+	long index;
+
+	/* The checks do not affect performance; only called from slow-paths. */
+
+	if (!is_kfence_address((void *)addr))
+		return NULL;
+
+	/*
+	 * May be an invalid index if called with an address at the edge of
+	 * __kfence_pool, in which case we would report an "invalid access"
+	 * error.
+	 */
+	index =3D (addr - (unsigned long)__kfence_pool) / (PAGE_SIZE * 2) - 1;
+	if (index < 0 || index >=3D CONFIG_KFENCE_NUM_OBJECTS)
+		return NULL;
+
+	return &kfence_metadata[index];
+}
+
 /* KFENCE error types for report generation. */
 enum kfence_error_type {
 	KFENCE_ERROR_OOB,		/* Detected a out-of-bounds access. */
diff --git a/mm/kfence/report.c b/mm/kfence/report.c
index f93a7b2a338b..5887fa610c9d 100644
--- a/mm/kfence/report.c
+++ b/mm/kfence/report.c
@@ -273,3 +273,37 @@ void kfence_report_error(unsigned long address, bool i=
s_write, struct pt_regs *r
 	/* We encountered a memory safety error, taint the kernel! */
 	add_taint(TAINT_BAD_PAGE, LOCKDEP_STILL_OK);
 }
+
+#ifdef CONFIG_PRINTK
+static void kfence_to_kp_stack(const struct kfence_track *track, void **kp=
_stack)
+{
+	int i, j;
+
+	i =3D get_stack_skipnr(track->stack_entries, track->num_stack_entries, NU=
LL);
+	for (j =3D 0; i < track->num_stack_entries && j < KS_ADDRS_COUNT - 1; ++i=
, ++j)
+		kp_stack[j] =3D (void *)track->stack_entries[i];
+	kp_stack[j] =3D NULL;
+}
+
+bool kfence_kmem_obj_info(struct kmem_obj_info *kpp, void *object)
+{
+	const struct kfence_metadata *meta =3D addr_to_metadata((unsigned long)ob=
ject);
+
+	if (!meta)
+		return false;
+
+	/* Requesting info an a never-used object is almost certainly a bug. */
+	if (WARN_ON(meta->state =3D=3D KFENCE_OBJECT_UNUSED))
+		return true;
+
+	kpp->kp_objp =3D (void *)meta->addr;
+
+	kfence_to_kp_stack(&meta->alloc_track, kpp->kp_stack);
+	if (meta->state =3D=3D KFENCE_OBJECT_FREED)
+		kfence_to_kp_stack(&meta->free_track, kpp->kp_free_stack);
+	/* get_stack_skipnr() ensures the first entry is outside allocator. */
+	kpp->kp_ret =3D kpp->kp_stack[0];
+
+	return true;
+}
+#endif
diff --git a/mm/slab.c b/mm/slab.c
index b04e40078bdf..4d44b094e0ab 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3675,6 +3675,10 @@ void kmem_obj_info(struct kmem_obj_info *kpp, void *=
object, struct slab *slab)
 	kpp->kp_slab =3D slab;
 	cachep =3D slab->slab_cache;
 	kpp->kp_slab_cache =3D cachep;
+
+	if (kfence_kmem_obj_info(kpp, object))
+		return;
+
 	objp =3D object - obj_offset(cachep);
 	kpp->kp_data_offset =3D obj_offset(cachep);
 	slab =3D virt_to_slab(objp);
diff --git a/mm/slub.c b/mm/slub.c
index 74d92aa4a3a2..c7d2cfd60b87 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4325,6 +4325,10 @@ void kmem_obj_info(struct kmem_obj_info *kpp, void *=
object, struct slab *slab)
 	kpp->kp_ptr =3D object;
 	kpp->kp_slab =3D slab;
 	kpp->kp_slab_cache =3D s;
+
+	if (kfence_kmem_obj_info(kpp, object))
+		return;
+
 	base =3D slab_address(slab);
 	objp0 =3D kasan_reset_tag(object);
 #ifdef CONFIG_SLUB_DEBUG
-- =

2.35.1.1094.g7c7d902a7c-goog

--===============9215900931869168817==--

