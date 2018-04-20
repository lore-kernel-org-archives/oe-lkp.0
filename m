Content-Type: multipart/mixed; boundary="===============8421793101881896480=="
MIME-Version: 1.0
From: Pavel Tatashin <pasha.tatashin@oracle.com>
To: lkp@lists.01.org
Subject: Re: c9e97a1997 BUG: kernel reboot-without-warning in early-boot stage, last printk: early console in setup code
Date: Fri, 20 Apr 2018 11:42:48 -0400
Message-ID: <CAGM2rebm1nU4=SAVQAObxsYEa9JpKZbYgeh+dcfb_pfEW6rxfA@mail.gmail.com>
In-Reply-To: <CAGM2reZvZZy6b+SEtpz_a_JTGBEB2nhBdfZJSZ89F99szv9peA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8421793101881896480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I have root caused the issue, and will submit a fix shortly. The fix
also fixes the per_cpu_ptr_to_phys bug that is sent in a separate
thread.

The issue arises in this stack:

start_kernel()
 trap_init()
  setup_cpu_entry_areas()
   setup_cpu_entry_area(cpu)
    get_cpu_gdt_paddr(cpu)
     per_cpu_ptr_to_phys(addr)
      pcpu_addr_to_page(addr)
       virt_to_page(addr)
        pfn_to_page(__pa(addr) >> PAGE_SHIFT)
The returned "struct page" is sometimes uninitialized, and thus
failing later when used. It turns out sometimes is because it depends
on KASLR.

When boot is failing we have this when  pfn_to_page() is called:
kasrl: 0x000000000d600000
 addr: ffffffff83e0d000
    pa: 1040d000
   pfn: 1040d
page: ffff88001f113340
page->flags ffffffffffffffff <- Uninitialized!

When boot is successful:
kaslr: 0x000000000a800000
 addr: ffffffff83e0d000
     pa: d60d000
    pfn: d60d
 page: ffff88001f05b340
page->flags 280000000000 <- Initialized!

Here are physical addresses that BIOS provided to us:
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001ffdffff] usable
[    0.000000] BIOS-e820: [mem 0x000000001ffe0000-0x000000001fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reser=
ved

In both cases, working and non-working the real physical address is the sam=
e:
pa - kasrl =3D 0x2E0D000

The only thing that is different is PFN.

We initialize struct pages in four places:

1. Early in boot a small set of struct pages is initialized to fill
the first section, and lower zones.
2. During mm_init() we initialize "struct pages" for all the memory
that is allocated, i.e reserved in memblock.
3. Using on-demand logic when pages are allocated after mm_init call
4. After smp_init() when the rest free deferred pages are initialized.

The above path happens before deferred memory is initialized, and thus
it must be covered either by 1, 2 or 3.

So, lets check what PFNs are initialized after (1).

memmap_init_zone() is called for pfn ranges:
1 - 1000, and 1000 - 1ffe0, but it quits after reaching pfn 0x10000,
as it leaves the rest to be initialized as deferred pages.

In the working scenario pfn ended up being below 1000, but in the
failing scenario it is above. Hence, we must initialize this page in
(2). But trap_init() is called before mm_init().

The bug was introduced by "mm: initialize pages on demand during boot"
because we lowered amount of pages that is initialized in the step
(1). But, it still could happen, because the number of initialized
pages was a guessing.

The proposed fix is this:

diff --git a/init/main.c b/init/main.c
index b795aa341a3a..870f75581cea 100644
--- a/init/main.c
+++ b/init/main.c
@@ -585,8 +585,8 @@ asmlinkage __visible void __init start_kernel(void)
        setup_log_buf(0);
        vfs_caches_init_early();
        sort_main_extable();
-       trap_init();
        mm_init();
+       trap_init();

        ftrace_init();

--===============8421793101881896480==--

