Content-Type: multipart/mixed; boundary="===============8356767077833556353=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@linux.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] 81a779a1a4: will-it-scale.per_thread_ops -4.2% regression
Date: Sun, 21 Mar 2021 13:01:28 +0200
Message-ID: <YFcniHqC0Lmet8/3@linux.ibm.com>
In-Reply-To: <20210319125138.GA30349@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8356767077833556353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Fri, Mar 19, 2021 at 08:51:38PM +0800, Oliver Sang wrote:
> Hi Hike,
> =

> On Fri, Mar 12, 2021 at 06:56:01AM +0200, Mike Rapoport wrote:
> > Hello,
> > =

> > On Wed, Mar 10, 2021 at 09:54:26AM +0800, kernel test robot wrote:
> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -4.2% regression of will-it-scale.per_thread_ops du=
e to commit:
> > > =

> > > =

> > > commit: 81a779a1a49c8644fd8dc994815a9aa379d10825 ("mm: introduce memf=
d_secret system call to create "secret" memory areas")
> > > https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git memfd-sec=
ret/v18
> > > =

> > > =

> > > in testcase: will-it-scale
> > > on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GHz with 192G memory
> > > with following parameters:
> > > =

> > > 	nr_task: 100%
> > > 	mode: thread
> > > 	test: futex1
> > > 	cpufreq_governor: performance
> > > 	ucode: 0x5003006
> > > =

> > > test-description: Will It Scale takes a testcase and runs it from 1 t=
hrough to n parallel copies to see if the testcase will scale. It builds bo=
th a process and threads based test in order to see any differences between=
 the two.
> > > test-url: https://github.com/antonblanchard/will-it-scale
> > > =

> > > =

> > > =

> > > If you fix the issue, kindly add following tag
> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > =

> > Can you please test the following patch on top of commit: 81a779a1a49c
> > ("mm: introduce memfd_secret system call to create "secret" memory area=
s")
> > to see if it performs better:
> =

> it performs a little better but still has -3.7% regression:
> =

> * e9be99d574c74 (linux-devel/fixup-81a779a1a49c) fix-81a779a1a49c-perf
> * 81a779a1a49c8 mm: introduce memfd_secret system call to create "secret"=
 memory areas
> * 043463bfe80b8 set_memory: allow querying whether set_direct_map_*() is =
actually enabled

Can you please retest with the below patch instead of the previous one:

diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
index 907a6734059c..6debaadb245d 100644
--- a/include/linux/secretmem.h
+++ b/include/linux/secretmem.h
@@ -4,8 +4,26 @@
 =

 #ifdef CONFIG_SECRETMEM
 =

+extern const struct address_space_operations secretmem_aops;
+
+static inline bool page_is_secretmem(struct page *page)
+{
+	page =3D compound_head(page);
+
+	/*
+	 * partially open code page_mapping() to avoid calling it on fast
+	 * path in get_user_pages_fast()
+	 */
+	if (PageMappingFlags(page) || PageSlab(page) || PageSwapCache(page))
+		return false;
+
+	if (!page->mapping)
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
index f2ae3f32a193..cfdb6d9a213d 100644
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
 =

-- =

Sincerely yours,
Mike.
--===============8356767077833556353==--

