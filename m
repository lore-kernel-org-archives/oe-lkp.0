Content-Type: multipart/mixed; boundary="===============3487117837121511842=="
MIME-Version: 1.0
From: Mike Rapoport <rppt@linux.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] 81a779a1a4: will-it-scale.per_thread_ops -4.2% regression
Date: Fri, 12 Mar 2021 06:56:01 +0200
Message-ID: <YEr0YYWLKCZJYXGo@linux.ibm.com>
In-Reply-To: <20210310015426.GA24132@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3487117837121511842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Mar 10, 2021 at 09:54:26AM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -4.2% regression of will-it-scale.per_thread_ops due to=
 commit:
> =

> =

> commit: 81a779a1a49c8644fd8dc994815a9aa379d10825 ("mm: introduce memfd_se=
cret system call to create "secret" memory areas")
> https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git memfd-secret/=
v18
> =

> =

> in testcase: will-it-scale
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: thread
> 	test: futex1
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

Can you please test the following patch on top of commit: 81a779a1a49c
("mm: introduce memfd_secret system call to create "secret" memory areas")
to see if it performs better:

diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
index 907a6734059c..a3541362431f 100644
--- a/include/linux/secretmem.h
+++ b/include/linux/secretmem.h
@@ -4,8 +4,19 @@
 =

 #ifdef CONFIG_SECRETMEM
 =

+extern const struct address_space_operations secretmem_aops;
+
+static inline bool page_is_secretmem(struct page *page)
+{
+	struct address_space *mapping =3D page_mapping(page);
+
+	if (!mapping)
+		return false;
+
+	return mapping->a_ops =3D=3D &secretmem_aops;
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

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n this email
>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-202006=
03.cgz/lkp-csl-2ap2/futex1/will-it-scale/0x5003006
> =

> commit: =

>   043463bfe8 ("set_memory: allow querying whether set_direct_map_*() is a=
ctually enabled")
>   81a779a1a4 ("mm: introduce memfd_secret system call to create "secret" =
memory areas")
> =

>  "/lkp/benchmarks/python3/bin/python3" "./runtest.py" "futex1" "295" "thr=
ead" "192"


-- =

Sincerely yours,
Mike.
--===============3487117837121511842==--

