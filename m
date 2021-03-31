Content-Type: multipart/mixed; boundary="===============7642709734728754649=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@linux.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] 81a779a1a4: will-it-scale.per_thread_ops -4.2% regression
Date: Wed, 31 Mar 2021 20:03:30 +0300
Message-ID: <YGSrYs9bNtwlegE7@linux.ibm.com>
In-Reply-To: <20210325064720.GB13061@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7642709734728754649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,


On Thu, Mar 25, 2021 at 02:47:20PM +0800, Oliver Sang wrote:
> Hi Mike,
> =

> On Sun, Mar 21, 2021 at 01:01:28PM +0200, Mike Rapoport wrote:
> > Hi Oliver,
> > =

> > On Fri, Mar 19, 2021 at 08:51:38PM +0800, Oliver Sang wrote:
> > > Hi Hike,
> > > =

> > > On Fri, Mar 12, 2021 at 06:56:01AM +0200, Mike Rapoport wrote:
> > > > Hello,
> > > > =

> > > > On Wed, Mar 10, 2021 at 09:54:26AM +0800, kernel test robot wrote:
> > > > > =

> > > > > Greeting,
> > > > > =

> > > > > FYI, we noticed a -4.2% regression of will-it-scale.per_thread_op=
s due to commit:
> > > > > =

> > > > > =

> > > > > commit: 81a779a1a49c8644fd8dc994815a9aa379d10825 ("mm: introduce =
memfd_secret system call to create "secret" memory areas")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git memfd=
-secret/v18
> > > > > =

> > > > > =

> > > > > in testcase: will-it-scale
> > > > > on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @=
 2.30GHz with 192G memory
> > > > > with following parameters:
> > > > > =

> > > > > 	nr_task: 100%
> > > > > 	mode: thread
> > > > > 	test: futex1
> > > > > 	cpufreq_governor: performance
> > > > > 	ucode: 0x5003006
> > > > > =

> > > > > test-description: Will It Scale takes a testcase and runs it from=
 1 through to n parallel copies to see if the testcase will scale. It build=
s both a process and threads based test in order to see any differences bet=
ween the two.
> > > > > test-url: https://github.com/antonblanchard/will-it-scale
> > > > > =

> > > > > =

> > > > > =

> > > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > =

> > > > Can you please test the following patch on top of commit: 81a779a1a=
49c
> > > > ("mm: introduce memfd_secret system call to create "secret" memory =
areas")
> > > > to see if it performs better:
> > > =

> > > it performs a little better but still has -3.7% regression:
> > > =

> > > * e9be99d574c74 (linux-devel/fixup-81a779a1a49c) fix-81a779a1a49c-perf
> > > * 81a779a1a49c8 mm: introduce memfd_secret system call to create "sec=
ret" memory areas
> > > * 043463bfe80b8 set_memory: allow querying whether set_direct_map_*()=
 is actually enabled
> > =

> > Can you please retest with the below patch instead of the previous one:
> =

> by below patch, the regression reduced to around -1.7%
> (please be noted, according to our experience, will-it-scale is normally =
sensitive
> to code change as well as test environment, so, at least currently, we do=
n't report
> will-it-scale performance changes if it's less than 3%)

I've pushed yet another fix to my tree at kernel.org:

https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git  memfd-secre=
t/v18.5

This is based on the current mmotm (v5.12-rc5-mmots-2021-03-30-23-07), the
patch is below for if you prefer to apply it to the older version.

I'd really appreciate if you could test it as well.

diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
index 907a6734059c..0fd19452a57e 100644
--- a/include/linux/secretmem.h
+++ b/include/linux/secretmem.h
@@ -4,8 +4,32 @@
 =

 #ifdef CONFIG_SECRETMEM
 =

+extern const struct address_space_operations secretmem_aops;
+
+static inline bool page_is_secretmem(struct page *page)
+{
+	struct address_space *mapping;
+
+	/*
+	 * Using page_mapping() is quite slow because of the actual call
+	 * isntruction and repeated compound_head(page) inside the
+	 * page_mapping() function.
+	 * We know that secretmem pages are not compound and LRU so we can
+	 * save a couple of cycles here.
+	 */
+	if (PageCompound(page) || !PageLRU(page))
+		return false;
+
+	mapping =3D (struct address_space *)
+		((unsigned long)page->mapping & ~PAGE_MAPPING_FLAGS);
+
+	if (mapping !=3D page->mapping)
+		return false;
+
+	return page->mapping->a_ops =3D=3D &secretmem_aops;
+}
+
 bool vma_is_secretmem(struct vm_area_struct *vma);
-bool page_is_secretmem(struct page *page);
 bool secretmem_active(void);
 =

 #else
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 3b1ba3991964..0bcd15e1b549 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -151,22 +151,12 @@ static void secretmem_freepage(struct page *page)
 	clear_highpage(page);
 }
 =

-static const struct address_space_operations secretmem_aops =3D {
+const struct address_space_operations secretmem_aops =3D {
 	.freepage	=3D secretmem_freepage,
 	.migratepage	=3D secretmem_migratepage,
 	.isolate_page	=3D secretmem_isolate_page,
 };
 =

-bool page_is_secretmem(struct page *page)
-{
-	struct address_space *mapping =3D page_mapping(page);
-
-	if (!mapping)
-		return false;
-
-	return mapping->a_ops =3D=3D &secretmem_aops;
-}
-
 static struct vfsmount *secretmem_mnt;
 =

 static struct file *secretmem_file_create(unsigned long flags)


-- =

Sincerely yours,
Mike.
--===============7642709734728754649==--

